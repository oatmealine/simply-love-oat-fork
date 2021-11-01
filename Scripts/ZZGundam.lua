------------------------------------------------
-- Global Variables Garbage Collection System --
------------------------------------------------
-- https://canary.discord.com/channels/227650173256466432/232998140502867975/904759746383446027
local _ENV = setmetatable({},{ __mode = "k" });

setmetatable(_G,{
	__index = function(t,k)
		return rawget(_ENV,k);
	end,
	__newindex = function(t,k,v)
		rawset(_ENV,k,v);
	end,
});
