local lines = {'Oh No', 'penis', 'funy time', 'not DDR', 'weed!!!', 'toilet spin', '┃  ┃╻ ┃┃ ┃▁', 'lux mortis simulator', 'tung tiied launcher', 'In The Groove 3?!?!?!', 'Press alt-f4', 'Try pressing f3+i', '->', 'i video love games', 'i hate video games', 'EA Sports', 'Also try Stepmania 5', 'oatmealine fucking DIES', ':pensive:', 'The Phoenix is a 20', 'stepmania', 'play get fucked', '. ゥ ( .I\' .', 'picross', 'do u agree', 'Now on Steam', ':blank:', 'threatening', 'im scared'}

math.randomseed(tonumber(os.date("%S")))
math.random( 1, #lines )

return string.format(
	"%s %s:  %s",

	FUCK_EXE and "NotITG" or "OpenITG", -- oitg/nitg
	string.gsub(string.gfind(GetSerialNumber(),"%d+%-%x+")(), -- ver
		"%x+$",
		function(s)
			return string.format("%03d",tonumber(s,16))
		end),
	lines[math.random(1, #lines)] -- le funy
)
