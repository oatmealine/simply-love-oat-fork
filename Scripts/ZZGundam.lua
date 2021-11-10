------------------------------------------------
-- Global Variables Garbage Collection System --
------------------------------------------------
-- https://canary.discord.com/channels/227650173256466432/232998140502867975/904759746383446027
local _G = getfenv();
local _M = {};

local newenv = setmetatable({},{
	__index = function(t,k)
		if not _M[k] then
			local f = rawget(_G,k);
			if f then
				if type(f) == "table" then
					rawset(_M,k,setmetatable({},{ __index = f }));
				else
					rawset(_M,k,f);
				end
			end
		end
		return rawget(_M,k);
	end,
	__newindex = function(t,k,v)
		rawset(_M,k,v);
	end,
});
if setfenv then
	setfenv(1,newenv);
else
	_ENV = newenv;
end