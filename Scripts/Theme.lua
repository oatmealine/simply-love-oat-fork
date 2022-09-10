
feetBaseZoom = .275
JudgeY = 20

lifeBarSizeAdd.Height = lifeBarSizeAdd.Height - 80
lifeBarSizeAdd.OffsetY = lifeBarSizeAdd.OffsetY + 40

if not FUCK_EXE then judgmentFontList = { 'Love' , 'Tactics', 'Chromatic', 'Deco', 'GrooveNights', 'FP', 'ITG2' } end
voiceOption = true

rateModsPay = { "1.0x", "1.1x", "1.2x", "1.3x", "1.4x", "1.5x", "1.6x", "1.7x", "1.8x", "1.9x", "2.0x" }
rateModsFree =  {"1.0x","1.05x","1.1x","1.15x","1.2x","1.25x","1.3x","1.35x","1.4x","1.45x","1.5x","1.55x","1.6x","1.65x","1.7x","1.75x","1.8x","1.85x","1.9x","1.95x","2.0x","0.5x","0.55x","0.6x","0.65x","0.7x","0.75x","0.8x","0.85x","0.9x","0.95x"}

screenList = { Gameplay = 'ScreenStage' , SelectMusic = 'ScreenSelectMusic' , PlayerOptions = 'ScreenPlayerOptions' , TitleMenu = ScreenTitleBranch  , NameEntry = 'ScreenNameEntryTraditional' , Evaluation = SelectEvaluationScreen , Summary = 'Summary' , Ending = SelectEndingScreen }

playerOptions[1] = { 'SpeedType','SpeedNumber','Mini','Perspective','NoteSkin','Turn','JudgmentFont','InputType','Rate' }
playerOptions[2] = { 'MetaMods1','MetaMods2','MetaMods3','Accel','Scroll','Effect','Appearance','Handicap','InsertTaps','InsertOther','Hide','Ghost','Compare','Measure','LifeBar' }

function CompareTextFormat(self,n) self:zoom(.3) end -- This is added on top of the base positioning etc.

ShowAllInRow = true

function NonCombos()
	local t = OptionRowBase('NonCombos')
	t.OneChoiceForAllPlayers = true
	t.Choices = { "On", "Decents Only", "Off" }
	t.LoadSelections = function(self, list, pn) if not Decents() then list[3] = true elseif not WayOffs() then list[2] = true else list[1] = true end end
	t.SaveSelections = function(self, list, pn)
		if list[1] then SetPref('JudgeWindowSecondsGood',0.135) SetPref('JudgeWindowSecondsBoo',0.180) end
		if list[2] then SetPref('JudgeWindowSecondsGood',0.135)	SetPref('JudgeWindowSecondsBoo',0.135) end
		if list[3] then	SetPref('JudgeWindowSecondsGood',0.102)	SetPref('JudgeWindowSecondsBoo',0.102) end
	end
	return t
end

function Decents() if math.abs(PREFSMAN:GetPreference('JudgeWindowSecondsGood') - 0.135) < .001 then return true end end
function WayOffs() if math.abs(PREFSMAN:GetPreference('JudgeWindowSecondsBoo') - 0.180) < .001 then return true end end

-- Input Type Option: Choose Pad or Key!
ModsMaster.InputType = { fnctn = 'InputTypeOption' }
function InputTypeOption()
	local t = OptionRowBase('Input Type',{'Off','DancePad','Keyboard'})
	t.OneChoiceForAllPlayers = true
	t.LoadSelections = function(self, list, pn)
		ModInputTypeCheck()
		list[ModCustom.InputType[pn+1]] = true
	end
	t.SaveSelections = function(self, list, pn)
		if list[1] then ModCustom.InputType[pn+1]=1 end
		if list[2] then ModCustom.InputType[pn+1]=2 end
		if list[3] then ModCustom.InputType[pn+1]=3 end
		ModInputTypeApply()
	end
	return t
end

function ModInputTypeCheck()
	if not ModCustom.InputType then
		if OatProfile().OATDefaultInputType==1 then ModCustom.InputType={1,1} end
		if OatProfile().OATDefaultInputType==2 then ModCustom.InputType={2,2} end
		if OatProfile().OATDefaultInputType==3 then ModCustom.InputType={3,3} end
		if OatProfile().OATDefaultInputType==4 then
			-- Auto(Card)
			ModCustom.InputType={3,3}
			local NumPL=GAMESTATE:GetNumPlayersEnabled()
			for i=1,NumPL do if PROFILEMAN:IsPersistentProfile(i-1) then 
				ModCustom.InputType={2,2}
				break
			end end
		end
		if OatProfile().OATDefaultInputType==5 then
			-- Auto(Connect)
			ModCustom.InputType={3,3}
			local devices=INPUTMAN:GetDescriptions()
			for i=1,#devices do if string.find(string.lower(devices[i]),"gamepad") or
								   string.find(string.lower(devices[i]),"controller") then
				ModCustom.InputType={2,2}
				break
			end end
		end
	end
end

function ModInputTypeApply()
	if ModCustom.InputType[1]==2 and OatProfile().OATInputTypeOffset2~='' then
		PREFSMAN:SetPreference('GlobalOffsetSeconds',tonumber(OatProfile().OATInputTypeOffset2)+.0)
	end
	if ModCustom.InputType[1]==3 and OatProfile().OATInputTypeOffset3~='' then
		PREFSMAN:SetPreference('GlobalOffsetSeconds',tonumber(OatProfile().OATInputTypeOffset3)+.0)
	end
end

function ModInputTypeSave()
	if ModCustom.InputType[1]==2 then
		OatProfile().OATInputTypeOffset2=tostring(PREFSMAN:GetPreference('GlobalOffsetSeconds'))
	end
	if ModCustom.InputType[1]==3 then
		OatProfile().OATInputTypeOffset3=tostring(PREFSMAN:GetPreference('GlobalOffsetSeconds'))
	end
end

-- not even used, but whatever.
function wrap(val,max,min)
	if not min then min = 0 end
	return math.mod(val+(max-min+1)-min,max-min+1)+min
end
