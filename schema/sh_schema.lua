--[[-------------------------------------------------------------------------
Purpose: This is where you set up everything for your schema. Title, description,
author, currency, custom flags.
---------------------------------------------------------------------------]]

-- Define gamemode information.
GM.Name = "Nocturlab Zombie AfterMath"
GM.Author = "Shiishii"
GM.Website = "http://zam.nocturlab.fr/"

nut.version = "2.0"

SCHEMA.name = "Nocturlab Zombie AfterMath" -- Change this name if you're going to create new schema.
SCHEMA.author = "Shiishii"
SCHEMA.desc = "The official Nocturla Zombie AfterMath Gamemode where the player take place in a future wasteland after an apocalyptical nuclear war."

-- Schema Help Menu. You can add more stuffs in cl_hooks.lua.
SCHEMA.helps = {
        ["About the schema"] =
        [[This is the official Nocturlab Zombie AfterMath schema for NutScript 1.1-beta
        <br>
        <br>This schema is huge NutScript gamemode where the player take place in a future wasteland after an apocalyptical nuclear war.
        <br>
        <br>I want to follow the main guideline of Nutscript : `Me or Other Players that plays your server does not want to feel dejavu when playing on your sever`]],
        ["What is this?"] =
        [[This schema is Nocturlab Zombie AfterMath v0.0.1.
        <br>This schema can is actually a secret. The author of schema, Shiishii of Nocturlab.]],
        ["About the author"] =
        [[This schema's author is Shiishii (https://github.com/shiipou).
        <br>I'll tell you more about me later.
        <br>You can send me some mail: shiishii@nocturlab.fr]]
}

if (SERVER) then --Serverside

        -- http://steamcommunity.com/sharedfiles/filedetails/?id=170149842
        -- NYPD Male Models
        resource.AddWorkshop(170149842) -- NYPD Male Models (https://steamcommunity.com/sharedfiles/filedetails/?id=311241022)
        resource.AddWorkshop(323285641) -- TDM Base GTA V (https://steamcommunity.com/sharedfiles/filedetails/?id=323285641)
        resource.AddWorkshop(1316337273) -- TDM GTA V Helicopters (https://steamcommunity.com/sharedfiles/filedetails/?id=1316337273)

        resource.AddWorkshop(104691717) -- PAC3 accessories (https://steamcommunity.com/sharedfiles/filedetails/?104691717)

        resource.AddWorkshop(1837527967) -- Life Mod: Graphic (https://steamcommunity.com/sharedfiles/filedetails/?1837527967)
        resource.AddWorkshop(131759821) -- VJ Base (https://steamcommunity.com/sharedfiles/filedetails/?131759821)
        resource.AddWorkshop(221942657) -- VJ No more room in Hell (https://steamcommunity.com/sharedfiles/filedetails/?221942657)
        resource.AddWorkshop(211818654) -- Zombie Swep (https://steamcommunity.com/sharedfiles/filedetails/?211818654)

        resource.AddWorkshop(1678408548) -- VRMod (https://steamcommunity.com/sharedfiles/filedetails/?1678408548)
        resource.AddWorkshop(1936962466) -- VRMod Swep (https://steamcommunity.com/sharedfiles/filedetails/?1936962466)

        resource.AddWorkshop(160250458) -- Wiremod (https://steamcommunity.com/sharedfiles/filedetails/?id=160250458)
        resource.AddWorkshop(773402917) -- Advanced Duplicator 2 (https://steamcommunity.com/sharedfiles/filedetails/?id=773402917)
        resource.AddWorkshop(428781078) -- Aftermath Night and Day (https://steamcommunity.com/sharedfiles/filedetails/?id=428781078)
        resource.AddWorkshop(207739713) -- NutScript Content (https://steamcommunity.com/sharedfiles/filedetails/?id=207739713)
else 		--Clientside
	
end

--Shared
nut.currency.set("µ", "scrap metal", "Scrap Metal") --Symbol, singular tense of currency, plural tense of currency

nut.flag.add("Z", "Allow user to became a zombie")

nut.util.include("sh_commands.lua")


