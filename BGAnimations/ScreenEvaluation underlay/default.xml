<ActorFrame><children>
	<ActorFrame InitCommand="%EvaluationInit" FirstUpdateCommand="%Evaluation" />
	<ActorFrame Command="queuecommand,Icon" IconCommand="%function() StyleIcon(); if not OatProfile().OATShowHeaders then SCREENMAN:GetTopScreen():GetChild('StyleIcon'):hidden(1) end end" />
	<ActorFrame
		Condition="GAMESTATE:IsPlayerEnabled(PLAYER_1)"
		Command="x,DoublesOffset()"
	><children>
		<ActorFrame Command="queuecommand,NonCombos"
			NonCombosCommand="%function() 
				if not WayOffs() then SCREENMAN:GetTopScreen():GetChild('BooNumberP1'):settext('    ') end 
				if not Decents() then SCREENMAN:GetTopScreen():GetChild('GoodNumberP1'):settext('    ') end
			end"
		/>

		<Layer Type="Quad"
			InitCommand="diffuse,#1E282F;stretchto,SCREEN_CENTER_X-310,409,SCREEN_CENTER_X-5,443;diffusealpha,0.2"
			OnCommand="%function(self) self:diffusealpha((OatProfile().OATResultsAlpha or 2) / 10) end"
		/>	
		<Layer Type="Quad"
			InitCommand="diffuse,#1E282F59;stretchto,SCREEN_CENTER_X-310,320,SCREEN_CENTER_X-5,409;diffusealpha,0.2"
			OnCommand="%function(self) self:diffusealpha((OatProfile().OATResultsAlpha or 2) / 10 * 0.35) end"
		/>	
	
		<Layer Type="Quad"
			InitCommand="diffuse,#1E282F;stretchto,SCREEN_CENTER_X-310,180,SCREEN_CENTER_X-5,355;diffusealpha,0.2"
			OnCommand="%function(self) self:diffusealpha((OatProfile().OATResultsAlpha or 2) / 10) end"
		/>					
		<Layer Type="Quad"
			InitCommand="diffuse,#00000077;stretchto,SCREEN_CENTER_X-310,180,SCREEN_CENTER_X-146,240;diffusealpha,0.2"
			OnCommand="%function(self) self:diffusealpha((OatProfile().OATResultsAlpha or 2) / 10 * 0.47) end"
		/>
	</children></ActorFrame>
	<ActorFrame
		Condition="GAMESTATE:IsPlayerEnabled(PLAYER_2)"
		Command="x,DoublesOffset()"
	><children>
		<ActorFrame Command="queuecommand,NonCombos"
			NonCombosCommand="%function() 
				if not WayOffs() then SCREENMAN:GetTopScreen():GetChild('BooNumberP2'):settext('    ') end 
				if not Decents() then SCREENMAN:GetTopScreen():GetChild('GoodNumberP2'):settext('    ') end
			end"
		/>

		<Layer Type="Quad"
			InitCommand="diffuse,#1E282F;stretchto,SCREEN_CENTER_X+5,409,SCREEN_CENTER_X+310,443;diffusealpha,0.2"
			OnCommand="%function(self) self:diffusealpha((OatProfile().OATResultsAlpha or 2) / 10) end"
		/>	
		<Layer Type="Quad"
			InitCommand="diffuse,#1E282F59;stretchto,SCREEN_CENTER_X+5,320,SCREEN_CENTER_X+310,409;diffusealpha,0.2"
			OnCommand="%function(self) self:diffusealpha((OatProfile().OATResultsAlpha or 2) / 10 * 0.35) end"
		/>	
	
		<Layer Type="Quad"
			InitCommand="diffuse,#1E282F;stretchto,SCREEN_CENTER_X+5,180,SCREEN_CENTER_X+310,355;diffusealpha,0.2"
			OnCommand="%function(self) self:diffusealpha((OatProfile().OATResultsAlpha or 2) / 10) end"
		/>	
		<Layer Type="Quad"
			InitCommand="diffuse,#00000077;stretchto,SCREEN_CENTER_X+146,180,SCREEN_CENTER_X+310,240;diffusealpha,0.2"
			OnCommand="%function(self) self:diffusealpha((OatProfile().OATResultsAlpha or 2) / 10 * 0.47) end"
		/>	
	</children></ActorFrame>
	<Layer
		File="@'../ScreenSelectMusic underlay/Banner'..Color()..'.png'"
		InitCommand="x,SCREEN_CENTER_X;y,SCREEN_TOP+115;;ZoomToWidth,278;ZoomToHeight,109"
		OnCommand="ztest,1;diffusealpha,0;linear,0.6;diffusealpha,1"
	/>
	<Layer File="@VocalizePath()..'read.xml'" Command="sleep,3;queuecommand,Voice" />

	<!-- rpc shenanigans -->
	<Layer
		Type="Quad"
		Condition="GAMESTATE:IsPlayerEnabled(PLAYER_1)"
		OnCommand="%function(self)
			self:hidden(1)
			oat_RPC:set('state', 'Results')

			oat_RPC:set('title', GAMESTATE:GetCurrentSong():GetDisplayMainTitle())
			oat_RPC:set('author', GAMESTATE:GetCurrentSong():GetDisplayArtist())
			oat_RPC:set('pack', GAMESTATE:GetCurrentSong():GetGroupName())
			oat_RPC:set('score', math.ceil(STATSMAN:GetCurStageStats():GetPlayerStageStats(0):GetPercentDancePoints() * 10000) / 100)

			oat_RPC:update()
		end"
	/>
</children></ActorFrame>
