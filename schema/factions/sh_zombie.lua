-- The 'nice' name of the faction.
FACTION.name = "Zombies"
-- This faction is default by the server.
-- This faction does not requires a whitelist.
FACTION.isDefault = false
FACTION.isGloballyRecognized = true
-- A description used in tooltips in various menus.
FACTION.desc = "The zombie faction."
-- A color to distinguish factions from others, used for stuff such as
-- name color in OOC chat.
FACTION.color = Color(200, 200, 80)

-- The list of models of the citizens.
-- Only default citizen can wear Advanced Citizen Wears and new facemaps.
local ZOMBIE_MODELS = {
	"models/Zombie/Classic.mdl",
	"models/Zombie/Fast.mdl",
	"models/Humans/corpse1.mdl"
}

local ZOMBIE_WEAPONS = {
        "weapon_vj_npccontroller",
        "weapon_weapons_butcher",
        "weapon_weapons_fleshpounder",
        "weapon_weapons_junkie",
        "weapon_weapons_nightmare",
        "weapon_weapons_ticklemonster",
        "weapon_weapons_basher",
        "weapon_weapons_bloatedzombie",
        "weapon_weapons_firezombie",
        "weapon_weapons_citizenzombie",
        "weapon_weapons_fastzombie",
        "weapon_weapons_freshdead",
        "weapon_weapons_corpsezombie",
        "weapon_weapons_poisonzombie",
        "weapon_weapons_stalker",
        "weapon_weapons_zombie",
        "weapon_weapons_zombine"
}

FACTION.weapons = ZOMBIE_WEAPONS
FACTION.models = CITIZEN_MODELS
FACTION.salary = 0
-- FACTION.index is defined when the faction is registered and is just a numeric ID.
-- Here, we create a global variable for easier reference to the ID.
FACTION_ZOMBIE = FACTION.index
