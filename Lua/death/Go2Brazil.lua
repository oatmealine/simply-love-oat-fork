local go2brazil = {}

function go2brazil:Setup()
    self(1):cmd("stretchto,0,0,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,1,0,0,0")
    self(2):cmd("xy,SCREEN_CENTER_X,SCREEN_CENTER_Y;diffusealpha,0;")
    
    if not self(2):hascommand("AfterFail_B") then
        self(2):addcommand("AfterFail_B",function(self)
            self:Load('/Themes/'..THEME:GetCurThemeName()..'/Screens/Overlay/Death/Go2Brazil/tenor.png')
        end)
    end
end

function go2brazil:Dead()
    GAMESTATE:ApplyGameCommand('sound,srt_hit')
    self(1):cmd("diffusealpha,.7;linear,.4;diffusealpha,0;")
    self(2):Load('/Themes/'..THEME:GetCurThemeName()..'/Screens/Overlay/Death/Go2Brazil/_tenor.gif')
    self(2):cmd("diffusealpha,1;linear,1;diffusealpha,0;queuecommand,AfterFail_B")
end

return go2brazil