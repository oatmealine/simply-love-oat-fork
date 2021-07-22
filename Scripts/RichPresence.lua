-- simple script that lets you put stuff into preferences in correspondance in whats happening In Game
-- the actual implementation is in xmls assorted across the theme :/

oat_RPC = {}
oat_RPC.data = {}

local isNvidia = false
local checkedVideoCard = false

local identifier = 'OATRPC@'
local seperator = '@'
local seperator2 = ':'

local dataValues = {
  state = 'string', -- 'Menu', 'Gameplay', 'Idle', 'Results'

  -- Gameplay / Results
  title = 'string',
  author = 'string',
  pack = 'string',
  
  -- Gameplay
  songstart = 'number', -- timestamp
  songend = 'number', -- timestamp

  -- Results
  score = 'number',

  -- Menu
  --browsingpack = 'string',
  browsingsince = 'number', -- timestamp

  -- Idle
  --idlesince = 'number', -- timestamp
}

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
    s = s .. k .. seperator2 .. v .. seperator
  end

  if not checkedVideoCard then
    isNvidia = string.find(string.lower(PREFSMAN:GetPreference('LastSeenVideoDriver')), 'nvidia') ~= nil
    checkedVideoCard = true

    if isNvidia then
      Trace('NVIDIA card detected')
    end
  end

  PREFSMAN:SetPreference('LastSeenVideoDriver', isNvidia and (s .. 'nvidia') or s)
end