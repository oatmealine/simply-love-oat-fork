
-- randomized headers, titles, static strings, etc, get it all here

ScreenTitleMenuHeaderTexts = {
  'go on. select something',
}
function ScreenTitleMenuHeaderTextSet(self)
  local t = ScreenTitleMenuHeaderTexts[math.random(1, #ScreenTitleMenuHeaderTexts)]
  if OatProfile().OATDisplayCustomHeaders ~= 1 then
    t = ''
  end
  self:settext(t)
end

ScreenSelectGameHeaderTexts = {
  'Game mode Sele c t tionnjfdhmngfgnfdmfythgnjmgfhbdxkjgsevrlbnkhj',
}
function ScreenSelectGameHeaderTextSet(self)
  local t = ScreenSelectGameHeaderTexts[math.random(1, #ScreenSelectGameHeaderTexts)]
  if OatProfile().OATDisplayCustomHeaders ~= 1 then
    t = 'SELECT GAMEMODE'
  end
  self:settext(t)
end

ScreenSelectColorHeaderTexts = {
  'color time babey!!!',
}
function ScreenSelectColorHeaderTextSet(self)
  local t = ScreenSelectColorHeaderTexts[math.random(1, #ScreenSelectColorHeaderTexts)]
  if OatProfile().OATDisplayCustomHeaders ~= 1 then
    t = 'SELECT COLOR'
  end
  self:settext(t)
end

ScreenSelectMusicHeaderTexts = {
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
  'WEED',
  'sussy baka',
  'sambai ice cream',
  'somebody scream',
  'WE ARE BACK',
  '1 2 3 4 5 6 do it!',
  'you wanna hear a joke?',
  'What wof you do if we acidebtal kiss..',
  'NEVER FUCK ALWAYS PISS',
  'born to shit forced to wipe',
  'slow star kanade',
  '??????????????? okay',
  'cool! your point?',
  'https://streamable.com/noooo',
  'conflict歌います。ズォールヒ～～↑wwwwヴィヤーンタースwwwwwワース フェスツwwwwwwwルオルwwwwwプローイユクwwwwwwwダルフェ スォーイヴォーwwwwwスウェン ネwwwwヤットゥ ヴ ヒェンヴガｒジョｊゴアｊガオガオッガwwwじゃｇｊｊ',
  'BEST BY 07 SEP 18 043 / 40',
  'me when the uhhhhh.... me when the when',
  'les gooo',
  'subo',
  'do a subo hop if u also think player cute',
  'what the dog doin',
  'hey check this out\n\n\n\n\n\n\n\nj',
  'the j',
  'why can\'t eggs have love',
  'yop',
}
function ScreenSelectMusicHeaderTextSet(self)
  local t = ScreenSelectMusicHeaderTexts[math.random(1, #ScreenSelectMusicHeaderTexts)]
  if OatProfile().OATDisplayCustomHeaders == 2 then
    t = 'SELECT SONG | ' .. t
  end
  if OatProfile().OATDisplayCustomHeaders == 3 then
    t = 'SELECT SONG'
  end
  self:settext(t)
end

ScreenPlayerOptionsHeaderTexts = {
  'get some mods, its free',
}
function ScreenPlayerOptionsHeaderTextSet(self)
  local t = ScreenPlayerOptionsHeaderTexts[math.random(1, #ScreenPlayerOptionsHeaderTexts)]
  if OatProfile().OATDisplayCustomHeaders ~= 1 then
    t = 'SELECT MODS'
  end
  self:settext(t)
end

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
  'nice cock',
  'thabks',
  'i love video james',
  'whats wrong, honey? you haven\'t even touched your jinner. did i overcook your jurger?',
  'beep',
  'skill issue',
  '#score-share be like',
  'ONYON did nothing wrong',
  'if you can read this, you\'re cute',
  'liver',
  ':clueless:',
  ':heeeh:',
  'are you a player? or are you a GAMER',
  'congratulations! it\'s a boy!',
  'MURD will win OISRT',
  'this is a 14, actually',
  'eat ass',
  'go touch grass',
  'slaps own ass',
  'Wordle 202',
  'https://www.google.com',
  'bd9b2458e8f46511cdca1c6a04aeabdc65e6cd32',
}
function ScreenEvaluationStageHeaderTextSet(self)
  local t = ScreenEvaluationStageHeaderTexts[math.random(1, #ScreenEvaluationStageHeaderTexts)]
  if OatProfile().OATDisplayCustomHeaders == 2 then
    t = 'RESULTS | ' .. t
  end
  if OatProfile().OATDisplayCustomHeaders == 3 then
    t = 'RESULTS'
  end
  self:settext(t)
end

ScreenSelectMusicCourseHeaderTexts = {
  'select cour se',
}
function ScreenSelectMusicCourseHeaderTextSet(self)
  local t = ScreenSelectMusicCourseHeaderTexts[math.random(1, #ScreenSelectMusicCourseHeaderTexts)]
  if OatProfile().OATDisplayCustomHeaders ~= 1 then
    t = 'SELECT COURSE'
  end
  self:settext(t)
end

ScreenTitleMenuTexts = { -- see Graphics/ScreenTitleMenu scroll choice1.xml
  'ok gimmie a sec while I take your wallet\nthis ain\'t free gaming you ungamer',
  '$ subo rm -rf /',
  'once this loaded, play year of the rats',
  '/).(\\',
  '*mwuah* uwu',
  'hey can I get an\nuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
  '...i need AV',
  'bibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibibi',
  'i am float now goodby e',
  'please do not the peeesh',
  'pastel is going to murder yall',
  'how many quotes do you think\nare oat\'s quotes',
  'https://sudospective.net/uwu',
  'DO YOU STILL REMBER',
  'fuck it, *metainverts your mods*',
  '',
  'hey, type while in gameplay into the console\nSCREENMAN()\:PauseGame(true)',
  'high class weapon theme',
  'obama\'s... last name........... is........\n.....................................................................................joe',
  'LOADING?\nLOAFING??',
  'not enough memory \not enough memory  ',
"I really love SHAME. Like, a lot. Like, a whole lot. \n\
You have no idea.\n\
I love her so much that it is inexplicable, \n\
and I'm ninety-nine percent sure that\n\
I have an unhealthy obsession.\n\
I will never get tired of listening that\n\
sweet, angelic voice of hers.\n\
It is my life goal to meet up her with her in real life\n\
and just say hello to her.",
}

function ScreenTitleMenuTextSet(self)
  local t = ScreenTitleMenuTexts[math.random(1, #ScreenTitleMenuTexts)]
  if OatProfile().OATDisplayCustomHeaders ~= 1 then
    t = ''
  end
  self:settext(t)
end
