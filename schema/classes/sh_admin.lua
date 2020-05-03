CLASS.name = "Administrator"
CLASS.desc = "This class allow you to use some admin magic."
CLASS.faction = FACTION_ADMIN

--[[-------------------------------------------------------------------------
Purpose: Who in the faction is allowed to become this class?
---------------------------------------------------------------------------]]
function CLASS:onCanBe(client)
	--If the client has the custom flag P then allow them to become this class.
	if client:getChar():hasFlags("A") then
		return true
	end
end

CLASS_ADMIN = CLASS.index
