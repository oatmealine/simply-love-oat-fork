
feetBaseZoom = .275
JudgeY = 20

lifeBarSizeAdd.Height = lifeBarSizeAdd.Height - 80
lifeBarSizeAdd.OffsetY = lifeBarSizeAdd.OffsetY + 40

if not FUCK_EXE then judgmentFontList = { 'Love' , 'Tactics', 'Chromatic', 'Deco', 'GrooveNights', 'FP', 'ITG2' } end
voiceOption = true

rateModsPay = { "1.0x", "1.1x", "1.2x", "1.3x", "1.4x", "1.5x", "1.6x", "1.7x", "1.8x", "1.9x", "2.0x" }
rateModsFree = { "1.0x", "1.1x", "1.2x", "1.3x", "1.4x", "1.5x", "1.6x", "1.7x", "1.8x", "1.9x", "2.0x", "0.5x", "0.6x", "0.7x" , "0.8x", "0.9x" }

screenList = { Gameplay = 'ScreenStage' , SelectMusic = 'ScreenSelectMusic' , PlayerOptions = 'ScreenPlayerOptions' , TitleMenu = ScreenTitleBranch  , NameEntry = 'ScreenNameEntryTraditional' , Evaluation = SelectEvaluationScreen , Summary = 'Summary' , Ending = SelectEndingScreen }

playerOptions[1] = { 'SpeedType','SpeedNumber','Mini','Perspective','NoteSkin','Turn','JudgmentFont','Voice','Rate' }
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

-- not even used, but whatever.
function wrap(val,max,min)
	if not min then min = 0 end
	return math.mod(val+(max-min+1)-min,max-min+1)+min
end



-- randomized headers, titles, static strings, etc, get it all here

ScreenTitleMenuHeaderTexts = {
  'go on. select something',
}
function ScreenTitleMenuHeaderTextSet(self) self:settext(ScreenTitleMenuHeaderTexts[math.random(1, #ScreenTitleMenuHeaderTexts)]) end

ScreenSelectGameHeaderTexts = {
  'Game mode Sele c t tionnjfdhmngfgnfdmfythgnjmgfhbdxkjgsevrlbnkhj',
}
function ScreenSelectGameHeaderTextSet(self) self:settext(ScreenSelectGameHeaderTexts[math.random(1, #ScreenSelectGameHeaderTexts)]) end

ScreenSelectColorHeaderTexts = {
  'color time babey!!!',
}
function ScreenSelectColorHeaderTextSet(self) self:settext(ScreenSelectColorHeaderTexts[math.random(1, #ScreenSelectColorHeaderTexts)]) end

ScreenSelectMusicHeaderTexts = {
  'hey hey ..... paly the big black',
  'oatmealine is the only folder that matters',
  'go on. select chance',
  'Are You In The Groove?',
  'you have 3 seconds to get in the groove',
  'penis music.',
  'Barack Obama',
  'insert funy here',
  'Cock',
  'oatmealine',
  'Open the !wips. Now',
  ':pensive:',
  'huge nintendo ds',
  'the burger',
  'h',
  '             e',
  '',
  'HOW',
  'play forbidden. now',
  ':sunglasses:',
  'play the ' .. math.random(1, 200) .. 'th pack in your collection',
  'WEED',
}
function ScreenSelectMusicHeaderTextSet(self) self:settext(ScreenSelectMusicHeaderTexts[math.random(1, #ScreenSelectMusicHeaderTexts)]) end

ScreenPlayerOptionsHeaderTexts = {
  'get some mods, its free',
}
function ScreenPlayerOptionsHeaderTextSet(self) self:settext(ScreenPlayerOptionsHeaderTexts[math.random(1, #ScreenPlayerOptionsHeaderTexts)]) end

ScreenEvaluationStageHeaderTexts = {
  'you suck',
  '#score-share time',
  'press PRTSCR to kill a family',
  'sonic the hedghehog',
  'penis!!!',
  'HOW',
  'YOU ROCK!',
  'm',
  'h',
  ',',
  'Cocke and Balls',
  'haha your sync is broken', 'gaming!!',
  'good job, She is proud of you',
  'hacking hacker.....',
  'wooow... not even an FC?? you suck',
  'PENIS',
  '',
  'wii phone',
  'xbox 720',
  'cant believe',
  'pain',
  'man',
  'horse',
  'cant believe they made taiko in nitg.....',
  'COCK',
  'pussy',
  'go post this on twitter. go brag about your score',
  'wouldnt it be a shame if... AV',
  'good job! the game will now AV',
  'music do be banging doe',
  'soulja boy tell em',
  'Polish toilet spin',
  'SCREENMAN:GetTopScreen():vibrate()',
  'h.how',
  'HOW IS THIS WOMAN',
  'ronaldinho soccer!!!',
  'wow youre terrible',
  'keyboard moment',
  'glitch2.frag moment',
  'it wasnt fault my game lagged',
  'skewllex',
  'what the Fuck',
  'benis',
  'weewee',
  'wenis!!!!!',
  'oatmealine is gay',
  'tung tiied gaming',
  'kfc gaming',
  'Denis',
  'bussy',
  '666 is a 14',
  'bye-bye',
  'skye is cute',
  'wahoo',
  'caulk',
}
function ScreenEvaluationStageHeaderTextSet(self) self:settext(ScreenEvaluationStageHeaderTexts[math.random(1, #ScreenEvaluationStageHeaderTexts)]) end

ScreenSelectMusicCourseHeaderTexts = {
  'select cour se',
}
function ScreenSelectMusicCourseHeaderTextSet(self) self:settext(ScreenSelectMusicCourseHeaderTexts[math.random(1, #ScreenSelectMusicCourseHeaderTexts)]) end
