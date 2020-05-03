CLASS.name = "Moderator"
CLASS.desc = "This class allow you to use some moderator magic."
CLASS.faction = FACTION_ADMIN

--[[-------------------------------------------------------------------------
Purpose: Who in the faction is allowed to become this class?
---------------------------------------------------------------------------]]
function CLASS:onCanBe(client)
	--If the client has the custom flag m then allow them to become this class.
	if client:getChar():hasFlags("m") then
		return true
	end
end

CLASS_MODERATOR = CLASS.index
