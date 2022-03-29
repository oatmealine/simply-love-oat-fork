local ssbmgame = {}

function ssbmgame:Setup()
    self(1):cmd("basezoomx,.8;basezoomy,.8;xy,SCREEN_CENTER_X,SCREEN_CENTER_Y;diffusealpha,0;")
end

function ssbmgame:Prepare()
    ssbmgame.Prepare = nil
end

function ssbmgame:Dead()
    GAMESTATE:ApplyGameCommand('sound,ssbm_game')
    self(1):cmd("sleep,0.16;linear,.04;diffusealpha,1;zoom,1.2;linear,.1;zoom,1;sleep,1;linear,.5;diffusealpha,0;")
	-- waiting roughly 1/6th of a second because ???? funny game/sound delay
end

return ssbmgame