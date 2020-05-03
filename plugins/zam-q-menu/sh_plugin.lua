PLUGIN.name = "ZAM Q menu"
PLUGIN.author = "Shiishii"
PLUGIN.desc = "Discard the game Q menu and open another Qmenu"

hook.Add( "SpawnMenuOpen", "FlagCheckPET", function()
   if LocalPlayer():getChar():getFaction() == FACTION_ADMIN then
       return true
   end
   return false
end )
