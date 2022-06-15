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
OatProfile().OATDisplayFriendZ = OatProfile().OATDisplayFriendZ or 1
OatProfile().OATResultGif = OatProfile().OATResultGif or 2
OatProfile().OATResultText = OatProfile().OATResultText or 2
OatProfile().OATResultRate = OatProfile().OATResultRate or 1
OatProfile().OATBackgroundShader = OatProfile().OATBackgroundShader or 2
OatProfile().OATRichPresence = OatProfile().OATRichPresence == nil and true or OatProfile().OATRichPresence
OatProfile().OATResultsAlpha = OatProfile().OATResultsAlpha or 2 -- floating point
OatProfile().OATShowHeaders = OatProfile().OATShowHeaders == nil and true or OatProfile().OATShowHeaders
OatProfile().OATShowPlaytime = OatProfile().OATShowPlaytime == nil and true or OatProfile().OATShowPlaytime
OatProfile().OATShowTotalPlaytime = OatProfile().OATShowTotalPlaytime == nil and true or OatProfile().OATShowTotalPlaytime
OatProfile().OATAggressiveRichPresence = OatProfile().OATAggressiveRichPresence == nil and false or OatProfile().OATAggressiveRichPresence
OatProfile().OATBackgroundBrightness = OatProfile().OATBackgroundBrightness or 5 -- floating point

OatProfile().OATTotalPlayedSongs = OatProfile().OATTotalPlayedSongs or 0
OatProfile().OATTotalPlayedFor = OatProfile().OATTotalPlayedFor or 0

function OptionSaveEverything()
  PROFILEMAN:SaveMachineProfile()
end

local function resetHeader()
  ScreenThemeOptionsHeader:settext('THEME OPTIONS')
  ScreenThemeOptionsHeaderTop:hidden(OatProfile().OATShowHeaders and 0 or 1)
  ScreenThemeOptionsHeader:hidden(OatProfile().OATShowHeaders and 0 or 1)
  SCREENMAN(10):hidden(OatProfile().OATShowHeaders and 0 or 1)
  ResultsAlphaPreview:hidden(1)
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
	t.Choices = {'Mix Random', 'PixelJumpers', 'PixelJumpers+', 'Just SHAME', 'Karens', 'Off'}
  t.LoadSelections = function(self, list) if OatProfile().OATDisplayFriendZ then list[OatProfile().OATDisplayFriendZ] = true else list[1] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATDisplayFriendZ = 1 end
		if list[2] then OatProfile().OATDisplayFriendZ = 2 end
		if list[3] then OatProfile().OATDisplayFriendZ = 3 end
		if list[4] then OatProfile().OATDisplayFriendZ = 4 end
		if list[5] then OatProfile().OATDisplayFriendZ = 5 end
		if list[6] then OatProfile().OATDisplayFriendZ = 6 end
    resetHeader()
    resetBackground()
	end
  return t
end

function OptionDisplayResultGIF()
  local t = OptionRowBase('ResultGradeGIF')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'On', 'FunnyFail', 'Off', 'FunnyFail-ONLY'}
  t.LoadSelections = function(self, list) if OatProfile().OATResultGif then list[OatProfile().OATResultGif] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATResultGif = 1 end
		if list[2] then OatProfile().OATResultGif = 2 end
		if list[3] then OatProfile().OATResultGif = 3 end
		if list[4] then OatProfile().OATResultGif = 4 end
    resetHeader()
    resetBackground()
	end
  return t
end

function OptionDisplayResultFunnyText()
  local t = OptionRowBase('ResultFunnyJudge')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'Text Only', 'Text with Animation', 'Off'}
  t.LoadSelections = function(self, list) if OatProfile().OATResultText then list[OatProfile().OATResultText] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATResultText = 1 end
		if list[2] then OatProfile().OATResultText = 2 end
		if list[3] then OatProfile().OATResultText = 3 end
    resetHeader()
    resetBackground()
	end
  return t
end

function OptionDisplayResultJudgeRate()
	local t = OptionRowBase('ResultJudgeRate')
	  t.OneChoiceForAllPlayers = true
	  t.Choices = {'Full Bar', 'Half Bar', 'Off'}
	t.LoadSelections = function(self, list) if OatProfile().OATResultRate then list[OatProfile().OATResultRate] = true else list[1] = true end end
	  t.SaveSelections = function(self, list)
		  if list[1] then OatProfile().OATResultRate = 1 end
		  if list[2] then OatProfile().OATResultRate = 2 end
		  if list[3] then OatProfile().OATResultRate = 3 end
	  resetHeader()
	  resetBackground()
	  end
	return t
end

function OptionBackgroundShader()
  local t = OptionRowBase('BackgroundShader')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'Random', 'earthbound.frag', 'plasma.frag', 'topologica.frag', 'theyaremanycolors.frag', 'descent.frag', 'rez_dubstepmyass.frag',
	'rez_mynameisjulia.frag', 'rez_roadtohell.frag', 'rez_structures.frag', 'rez_thedescent.frag', 'solid color', 'star factory', 'glacia'}
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
		if list[12] then OatProfile().OATBackgroundShader = 12 end
		if list[13] then OatProfile().OATBackgroundShader = 13 end
		if list[14] then OatProfile().OATBackgroundShader = 14 end
    MESSAGEMAN:Broadcast('UpdateBackgroundShader')

    SCREENMAN:GetTopScreen()(1)(2):diffusealpha(0.3)
    if list[4] or list[6] or list[7] or list[8] or list[9] or list[10] or list[11] or list[14] then
      ScreenThemeOptionsHeader:settext('THEME OPTIONS | This is a very intensive shader!')
    else
      resetHeader()
    end
	end
  return t
end

function OptionRichPresence()
  local t = OptionRowBase('RichPresence')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'On', 'Off'}
  t.LoadSelections = function(self, list) if OatProfile().OATRichPresence then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATRichPresence = true  end
		if list[2] then OatProfile().OATRichPresence = false end
    resetHeader()
    resetBackground()
	end
  return t
end

function OptionResultsAlpha()
  local t = OptionRowBase('ResultsAlpha')

  t.OneChoiceForAllPlayers = true

	local Names = {}
  for i = 0, 1, 0.1 do table.insert(Names, i) end

  t.Choices = Names
	t.LoadSelections = function(self, list)
    local a = OatProfile().OATResultsAlpha
		for i,v in ipairs(Names) do
			if tostring(a / 10) == tostring(v) then list[i] = true return end
		end

		list[#list] = true;	-- default to 1
	end

	t.SaveSelections = function(self, list)
		for i,v in ipairs(Names) do
			if list[i] then
        OatProfile().OATResultsAlpha = v * 10
      end
		end
    resetHeader()
    resetBackground()
    ResultsAlphaPreview:hidden(0)
    for i,v in ipairs(ResultsAlphaPreview:GetChildren()) do
      v:queuecommand('Update')
    end
    SCREENMAN:GetTopScreen()(1)(2):diffusealpha(0)
	end

  t.LayoutType = 'ShowOneInRow'

	return t
end

function OptionBackgroundBrightness()
  local t = OptionRowBase('BackgroundBrightness')

  t.OneChoiceForAllPlayers = true

	local Names = {}
  for i = 0, 1, 0.1 do table.insert(Names, i) end

  t.Choices = Names
	t.LoadSelections = function(self, list)
    local a = OatProfile().OATBackgroundBrightness
		for i,v in ipairs(Names) do
			if tostring(a / 10) == tostring(v) then list[i] = true return end
		end

		list[#list] = true;	-- default to 1
	end

	t.SaveSelections = function(self, list)
		for i,v in ipairs(Names) do
			if list[i] then
        OatProfile().OATBackgroundBrightness = v * 10
      end
		end
    resetHeader()
    resetBackground()
    MESSAGEMAN:Broadcast('UpdateBackgroundShader')
    SCREENMAN:GetTopScreen()(1)(2):diffusealpha(0.3)
	end

  t.LayoutType = 'ShowOneInRow'

	return t
end

function OptionShowHeaders()
  local t = OptionRowBase('ShowHeaders')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'On', 'Off'}
  t.LoadSelections = function(self, list) if OatProfile().OATShowHeaders then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATShowHeaders = true  end
		if list[2] then OatProfile().OATShowHeaders = false end
    resetHeader()
    resetBackground()
	end
  return t
end

function OptionShowPlaytime()
  local t = OptionRowBase('ShowPlaytime')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'On', 'Off'}
  t.LoadSelections = function(self, list) if OatProfile().OATShowPlaytime then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATShowPlaytime = true  end
		if list[2] then OatProfile().OATShowPlaytime = false end
    resetHeader()
    resetBackground()
	end
  return t
end

function OptionShowTotalPlaytime()
  local t = OptionRowBase('ShowTotalPlaytime')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'On', 'Off'}
  t.LoadSelections = function(self, list) if OatProfile().OATShowTotalPlaytime then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATShowTotalPlaytime = true  end
		if list[2] then OatProfile().OATShowTotalPlaytime = false end
    resetHeader()
    resetBackground()
	end
  return t
end

function OptionAggressiveRichPresence()
  local t = OptionRowBase('AggressiveRichPresence')
	t.OneChoiceForAllPlayers = true
	t.Choices = {'On', 'Off'}
  t.LoadSelections = function(self, list) if OatProfile().OATAggressiveRichPresence then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then OatProfile().OATAggressiveRichPresence = true  end
		if list[2] then OatProfile().OATAggressiveRichPresence = false end
    resetHeader()
    resetBackground()
	end
  return t
end
