PLUGIN.name = "Admin commands"
PLUGIN.author = "Shiishii"
PLUGIN.desc = "Add more administration related commands."

nut.command.add("chargetmoney", {
  adminOnly = true,
  syntax = "<string target> <string faction>",
  onRun = function(client, arguments)
    local target = nut.command.findPlayer(client, arguments[1])

    local character = target:getChar()
    if(target and character) then
      character:setFaction(arguments[2])
      client:notifyLocalized(character:getName().." is now in faction "..character:getFaction()..".")
    end
  end
})
