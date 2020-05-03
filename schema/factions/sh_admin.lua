FACTION.name = "Administration"
FACTION.desc = "You are a part of the Administration, you must take a look on people."
FACTION.color = Color(255, 0, 0)
FACTION.isDefault = false
FACTION.isGloballyRecognized = false

function FACTION:PlayerNoClip(client)
  return true
end

function FACTION:PhysgunPickup(client, entity)
  return true
end

function FACTION:onSpawn(client)
    -- Custom health and armor for players in this faction.
    client:SetHealth(99999)
    client:SetArmor(99999)
end

FACTION.weapons = {
        "nut_stunstick"
}

FACTION.models = {
  "models/police.mdl",
  "models/alyx.mdl"
}

FACTION.salary = 0

FACTION_ADMIN = FACTION.index
