CLASS.name = "Zombie"
CLASS.desc = "Just find something to eat."
CLASS.faction = FACTION_ZOMBIE

--[[-------------------------------------------------------------------------
Purpose: Who in the faction is allowed to become this class?
---------------------------------------------------------------------------]]
function CLASS:onCanBe(client)
	--If the client has the custom flag Z then allow them to become this class.
	if client:getChar():hasFlags("Z") then
		return true
	end
end

CLASS_ZOMBIE = CLASS.index
