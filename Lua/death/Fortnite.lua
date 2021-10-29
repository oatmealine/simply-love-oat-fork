local fortnite = {}

function fortnite:Setup()
    self(1):cmd("stretchto,0,0,SCREEN_WIDTH,SCREEN_HEIGHT;diffusealpha,0") -- I hope you play only at 4:3
	math.randomseed(math.random() * 1000000 + Second() * Hour() * DayOfYear())
	self(1):Load(Path('Graphics', '../Screens/Overlay/Death/Fortnite/' .. math.random(1, 22)))
end

function fortnite:Dead()
    GAMESTATE:ApplyGameCommand('sound,vine_thud')
	self(1):cmd("sleep,.16666;diffusealpha,1;sleep,.277;diffusealpha,0;")
end

return fortnite