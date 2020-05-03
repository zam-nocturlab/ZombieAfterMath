-- The 'nice' name of the faction.
FACTION.name = "Zombies"
-- This faction is default by the server.
-- This faction does not requires a whitelist.
FACTION.isDefault = true
FACTION.isGloballyRecognized = true
-- A description used in tooltips in various menus.
FACTION.desc = "The zombie faction. Search something to eat."
-- A color to distinguish factions from others, used for stuff such as
-- name color in OOC chat.
FACTION.color = Color(200, 200, 80)

nut.flag.add("Z", "User can play as zombie")

function FACTION:onCheckLimitReached(character, client)
    return team.NumPlayers(self.index) < math.Round(team.NumPlayers(FACTION_CITIZEN) * 0.25)
end

FACTION.weapons = {
  "weapon_vj_npccontroller"
}

FACTION.models = {
  "models/Zombie/Classic.mdl",
  "models/Zombie/Fast.mdl",
  "models/Humans/corpse1.mdl"
}

FACTION.salary = 0
-- FACTION.index is defined when the faction is registered and is just a numeric ID.
-- Here, we create a global variable for easier reference to the ID.
FACTION_ZOMBIE = FACTION.index
