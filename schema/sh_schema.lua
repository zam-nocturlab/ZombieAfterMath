SCHEMA.name = "Nocturlab Zombie AfterMath" -- Change this name if you're going to create new schema.
SCHEMA.author = "Shiipou"
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
	<br>This schema can is actually a secret. The author of shcema, Shiishii of Nocturlab.]],
	["About the author"] = 
	[[This schema's author is Shiishii (https://github.com/shiipou).
	<br>I'll tell you more about me later.
	<br>You can send me some mail: shiishii@nocturlab.fr]]
}

if (SERVER) then
	-- http://steamcommunity.com/sharedfiles/filedetails/?id=170149842
	-- NYPD Male Models
	resource.AddWorkshop(170149842) -- NYPD Male Models (https://steamcommunity.com/sharedfiles/filedetails/?id=311241022)
	resource.AddWorkshop(323285641) -- TDM Base GTA V (https://steamcommunity.com/sharedfiles/filedetails/?id=323285641)

	resource.AddWorkshop(1837527967) -- Life Mod: Graphic (https://steamcommunity.com/sharedfiles/filedetails/?1837527967)
	resource.AddWorkshop(632126111) -- iNPC: Better AI (https://steamcommunity.com/sharedfiles/filedetails/?632126111)

	resource.AddWorkshop(1678408548) -- VRMod (https://steamcommunity.com/sharedfiles/filedetails/?1678408548)
	
	resource.AddWorkshop(160250458) -- Wiremod (https://steamcommunity.com/sharedfiles/filedetails/?id=160250458)
	resource.AddWorkshop(773402917) -- Advanced Duplicator 2 (https://steamcommunity.com/sharedfiles/filedetails/?id=773402917)
	resource.AddWorkshop(1619568273) -- Girls Frontline: Operation Binary [Content] (https://steamcommunity.com/sharedfiles/filedetails/?id=1619568273)
	resource.AddWorkshop(1455864074) -- Makoto Naegi (PlayerModel) (https://steamcommunity.com/sharedfiles/filedetails/?id=1455864074)
	resource.AddWorkshop(917473762) -- Nier:Automata || 9S [PM/RAG] (https://steamcommunity.com/sharedfiles/filedetails/?id=917473762)
	resource.AddWorkshop(1597648507) -- TDA Puppet (https://steamcommunity.com/sharedfiles/filedetails/?id=1597648507)
	resource.AddWorkshop(1420329725) -- Touhou Project - Hata no Kokoro [Anek] - Player Model and NPC (https://steamcommunity.com/sharedfiles/filedetails/?id=1420329725)
	resource.AddWorkshop(428781078) -- Aftermath Night and Day (https://steamcommunity.com/sharedfiles/filedetails/?id=428781078)
	resource.AddWorkshop(207739713) -- NutScript Content (https://steamcommunity.com/sharedfiles/filedetails/?id=207739713)

	-- Adding Gasmask Resources
	resource.AddFile("sound/gasmaskon.wav")
	resource.AddFile("sound/gasmaskoff.wav")
	resource.AddFile("sound/gmsk_in.wav")
	resource.AddFile("sound/gmsk_out.wav")
	resource.AddFile("materials/gasmask_fnl.vmt")
	resource.AddFile("materials/gasmask3.vtf")
	resource.AddFile("materials/gasmask3_n.vtf")
	resource.AddFile("materials/shtr_01.vmt")
	resource.AddFile("materials/shtr.vtf")
	resource.AddFile("materials/shtr_n.vtf")

	-- Adding Schema Resources
	resource.AddFile("materials/modernrp/dankweed.png")
	resource.AddFile("materials/modernrp/hitmarker.png")
	resource.AddFile("materials/effects/fas_muzzle1.png")
	resource.AddFile("materials/effects/fas_muzzle2.png")
	resource.AddFile("materials/effects/fas_muzzle3.png")
	resource.AddFile("materials/effects/fas_muzzle4.png")
	resource.AddFile("materials/effects/fas_muzzle5.png")
	resource.AddFile("materials/effects/fas_muzzle6.png")
	resource.AddFile("materials/effects/fas_muzzle7.png")
	resource.AddFile("materials/effects/fas_muzzle8.png")
	resource.AddFile("sound/ui/bad.wav")
	resource.AddFile("sound/ui/bip.wav")
	resource.AddFile("sound/ui/boop.wav")
	resource.AddFile("sound/ui/charged.wav")
	resource.AddFile("sound/ui/confirm.wav")
	resource.AddFile("sound/ui/deny.wav")
	resource.AddFile("sound/ui/extended.wav")
	resource.AddFile("sound/ui/good.wav")
	resource.AddFile("sound/ui/notify.wav")
	resource.AddFile("sound/ui/okay.wav")
	resource.AddFile("sound/ui/welcome.wav")
	resource.AddFile("sound/policesiren.wav")
end

nut.util.include("sh_configs.lua")
nut.util.include("cl_effects.lua")
nut.util.include("sv_hooks.lua")
nut.util.include("cl_hooks.lua")
nut.util.include("sh_hooks.lua")
nut.util.include("sh_commands.lua")
nut.util.include("meta/sh_player.lua")
nut.util.include("meta/sh_entity.lua")
nut.util.include("meta/sh_character.lua")
nut.util.include("sh_dev.lua") -- Developer Functions

nut.dialogue.loadFromDir(SCHEMA.folder .. "/schema/dialogues")
