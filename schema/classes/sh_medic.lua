CLASS.name = "Medic"
CLASS.faction = FACTION_CITIZEN
CLASS.business = {
	-- Heal stuff
	["aidkit"] = 10,
	["healvial"] = 5,
	["healthkit"] = 1
}

function CLASS:OnSet(client)
	
end

CLASS_MEDIC = CLASS.index
