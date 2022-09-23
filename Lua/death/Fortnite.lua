local fortnite = {}

function fortnite:Setup()
    self(1):cmd("stretchto,0,0,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,1,0,0,0")
    self(2):cmd("xy,SCREEN_CENTER_X,SCREEN_CENTER_Y;align,.5,.5;diffusealpha,0;")

    if not self(2):hascommand("AfterFail_F") then
        self(2):addcommand("AfterFail_F",function(self)
            self:Load(Path('Graphics', '_fortniteDeath/_1.jpg'))
        end)
    end
end

function fortnite:Dead()
    self(1):cmd("sleep,.1212;diffusealpha,.7;linear,.277;diffusealpha,.5;diffusealpha,0;") --.336
    math.randomseed(math.random() * 1000000 + Second() * Hour() * DayOfYear()) -- this is jank
    self(2):Load(Path('Graphics', '_fortniteDeath/_' .. math.random(1, 23)))
    self(2):cmd("scaletofit,SCREEN_CENTER_X*.25,SCREEN_CENTER_Y*.25,SCREEN_CENTER_X*1.75,SCREEN_CENTER_Y*1.75")
    GAMESTATE:ApplyGameCommand('sound,vine_thud')
    self(2):cmd("sleep,.1212;diffusealpha,1;sleep,.277;diffusealpha,0;queuecommand,AfterFail_F")
end

return fortnite
