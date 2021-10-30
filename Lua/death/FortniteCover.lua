local fortniteCover = {}

function fortniteCover:Setup()
    self(1):cmd("stretchto,0,0,SCREEN_WIDTH,SCREEN_HEIGHT;diffusealpha,0") -- I hope you play only at 4:3
end

function fortniteCover:Dead()
	math.randomseed(math.random() * 1000000 + Second() * Hour() * DayOfYear()) -- this is jank
	self(1):Load(Path('Graphics', '_fortniteDeath/_' .. math.random(1, 23)))
	self(1):cmd("stretchto,0,0,SCREEN_WIDTH,SCREEN_HEIGHT;diffusealpha,0")
    GAMESTATE:ApplyGameCommand('sound,vine_thud')
	self(1):cmd("sleep,.1212;diffusealpha,1;sleep,.277;diffusealpha,0;")
end

return fortniteCover