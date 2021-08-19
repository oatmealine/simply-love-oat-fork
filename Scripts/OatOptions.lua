-- used in ScreenThemeOptions
function OatProfile(raw)
  local saved = PROFILEMAN:GetMachineProfile():GetSaved()
  if not raw then
    if saved.OATBackgroundShader == 1 then
      saved.OATBackgroundShader = math.random(2, 5)
    end
  end
  return saved
end

-- set defaults
OatProfile().OATDisplayCustomHeaders = OatProfile().OATDisplayCustomHeaders or 1
OatProfile().OATDisplayFriends = OatProfile().OATDisplayFriends == nil and true or OatProfile().OATDisplayFriends
OatProfile().OATFailGifs = OatProfile().OATFailGifs == nil and true or OatProfile().OATFailGifs
OatProfile().OATBackgroundShader = OatProfile().OATBackgroundShader or 2

function OptionSaveEverything()
  PROFILEMAN:SaveMachineProfile()
end

local function resetHeader()
  ScreenThemeOptionsHeader:settext('THEME OPTIONS')
end
local function resetBackground()
  SCREENMAN:GetTopScreen()(1)(2):diffusealpha(1)
end

function OptionTesting(...)
  SCREENMAN:SystemMessage(table.concat({args}))
end

function OptionDisplayCustomHeaders()
  local t = OptionRowBase('FunnyHeaders')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'Always', 'Occasionally', 'Disable'}
	t.LoadSelections = function(self, list) if OatProfile().OATDisplayCustomHeaders then list[OatProfile().OATDisplayCustomHeaders] = true else list[1] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATDisplayCustomHeaders = 1 end
		if list[2] then OatProfile().OATDisplayCustomHeaders = 2 end
		if list[3] then OatProfile().OATDisplayCustomHeaders = 3 end

    if ScreenThemeOptionsHeader then
      if list[1] then
        ScreenThemeOptionsHeader:settext('This header will display random junk at all times')
      elseif list[2] then
        ScreenThemeOptionsHeader:settext('This header will only display random junk in certain screens')
      elseif list[3] then
        ScreenThemeOptionsHeader:settext('This header will stay the same')
      end
    end
    resetBackground()
	end
	return t
end

function OptionDisplaySongSelectFriends()
  local t = OptionRowBase('SongSelectFriends')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'On', 'Off'}
  t.LoadSelections = function(self, list) if OatProfile().OATDisplayFriends then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATDisplayFriends = true  end
		if list[2] then OatProfile().OATDisplayFriends = false end
    resetHeader()
    resetBackground()
	end
  return t
end

function OptionDisplayFailImages()
  local t = OptionRowBase('RandomFailGIFs')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'On', 'Off'}
  t.LoadSelections = function(self, list) if OatProfile().OATFailGifs then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATFailGifs = true  end
		if list[2] then OatProfile().OATFailGifs = false end
    resetHeader()
    resetBackground()
	end
  return t
end

function OptionBackgroundShader()
  local t = OptionRowBase('BackgroundShader')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'Random', 'earthbound.frag', 'plasma.frag', 'topologica.frag', 'theyaremanycolors.frag', 'descent.frag', 'rez_dubstepmyass.frag', 'rez_mynameisjulia.frag', 'rez_roadtohell.frag', 'rez_structures.frag', 'rez_thedescent.frag'}
    t.LoadSelections = function(self, list) if OatProfile().OATBackgroundShader then list[OatProfile().OATBackgroundShader] = true else list[1] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATBackgroundShader = 1 end
		if list[2] then OatProfile().OATBackgroundShader = 2 end
		if list[3] then OatProfile().OATBackgroundShader = 3 end
		if list[4] then OatProfile().OATBackgroundShader = 4 end
		if list[5] then OatProfile().OATBackgroundShader = 5 end
		if list[6] then OatProfile().OATBackgroundShader = 6 end
		if list[7] then OatProfile().OATBackgroundShader = 7 end
		if list[8] then OatProfile().OATBackgroundShader = 8 end
		if list[9] then OatProfile().OATBackgroundShader = 9 end
		if list[10] then OatProfile().OATBackgroundShader = 10 end
		if list[11] then OatProfile().OATBackgroundShader = 11 end
    MESSAGEMAN:Broadcast('UpdateBackgroundShader')

    SCREENMAN:GetTopScreen()(1)(2):diffusealpha(0.3)
    if list[4] or list[6] or list[7] or list[8] or list[9] or list[10] or list[11] then
      ScreenThemeOptionsHeader:settext('THEME OPTIONS | This is a very intensive shader!')
    else
      resetHeader()
    end
	end
  return t
end
