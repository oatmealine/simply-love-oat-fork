-- simple script that lets you put stuff into preferences in correspondance in whats happening In Game
-- the actual implementation is in xmls assorted across the theme :/

oat_RPC = {}
oat_RPC.data = {}

local pref = 'LastSeenVideoDriver'

local identifier = 'OATRPC@'
local seperator = '@'
local seperator2 = ':'

local dataValues = {
  state = 'string', -- 'Menu', 'Gameplay', 'Idle', 'Results', 'Editor', 'ColorSelect', 'Options'

  -- Gameplay / Results
  title = 'string',
  author = 'string',
  pack = 'string',
  
  -- Gameplay
  songstart = 'number', -- timestamp
  songend = 'number', -- timestamp
  marathon = 'boolean',

  -- Results
  score = 'number',

  -- Menu
  --browsingpack = 'string',
  browsingsince = 'number', -- timestamp

  -- Idle
  --idlesince = 'number', -- timestamp

  -- Editor
  playtesting = 'boolean',
  selecting = 'boolean',
}

local isNvidia = false
local checkedVideoCard = false

function oat_RPC:set(key, val, force)
  if dataValues[key] == type(val) then
    oat_RPC.data[key] = val
    return val
  elseif not key then
    error('no key given', 2)
  elseif not dataValues[key] then
    error(key .. ' is not a valid key', 2)
  else
    error('invalid type for ' .. key .. ', should be ' .. dataValues[key] .. ', got ' .. type(val), 2)
  end
end
function oat_RPC:get(key)
  return oat_RPC.data[key]
end
function oat_RPC:update()
  local s = identifier

  for k,v in pairs(oat_RPC.data) do
    local f = v
    if type(v) == 'boolean' then f = v and 'true' or 'false' end
    s = s .. k .. seperator2 .. f .. seperator
  end

  if not checkedVideoCard then
    isNvidia = string.find(string.lower(PREFSMAN:GetPreference(pref)), 'nvidia') ~= nil
    checkedVideoCard = true

    if isNvidia then
      Trace('NVIDIA card detected')
    end
  end

  PREFSMAN:SetPreference(pref, isNvidia and (s .. 'nvidia') or s)
end