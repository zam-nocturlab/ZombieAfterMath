if (SERVER) then
	util.AddNetworkString("OpenInvMenu")

	function ItemCanEnterForEveryone(inventory, action, context)
		if (action == "transfer") then return true end
	end

	function CanReplicateItemsForEveryone(inventory, action, context)
		if (action == "repl") then return true end
	end
else
	net.Receive("OpenInvMenu", function()
		local target = net.ReadEntity()
		local index = net.ReadType()

		local targetInv = nut.inventory.instances[index]
		local myInv = LocalPlayer():getChar():getInv()

		local inventoryDerma = targetInv:show()
		inventoryDerma:SetTitle(target:getChar():getName().."'s Inventory")
		inventoryDerma:MakePopup()
		inventoryDerma:ShowCloseButton(true)

		local myInventoryDerma = myInv:show()
		myInventoryDerma:MakePopup()
		myInventoryDerma:ShowCloseButton(true)
		myInventoryDerma:SetParent(inventoryDerma)
		myInventoryDerma:MoveLeftOf(inventoryDerma, 4)
	end)
end
	--[[-------------------------------------------------------------------------
	Purpose: Check other players inventory's
	---------------------------------------------------------------------------]]
	nut.command.add("checkinventory", {
		adminOnly = true,
		syntax = "<string target>",
		onRun = function(client, arguments)
			local target = nut.command.findPlayer(client, arguments[1])
			if (IsValid(target) and target:getChar() and target != client) then
				local inventory = target:getChar():getInv()
				inventory:addAccessRule(ItemCanEnterForEveryone, 1)
				inventory:addAccessRule(CanReplicateItemsForEveryone, 1)
				inventory:sync(client)
				net.Start("OpenInvMenu")
				net.WriteEntity(target)
				net.WriteType(inventory:getID())
				net.Send(client)
			elseif (target == client) then
				client:notifyLocalized("This isn't meant for checking your own inventory.")
			end
		end
	})

	--[[-------------------------------------------------------------------------
	Purpose: Check other players money amount.
	---------------------------------------------------------------------------]]
	nut.command.add("chargetmoney", {
		adminOnly = true,
		syntax = "<string target>",
		onRun = function(client, arguments)
			local target = nut.command.findPlayer(client, arguments[1])
			local character = target:getChar()
			client:notifyLocalized(character:getName().." has "..character:getMoney()..".")
		end
	})

	nut.command.add("tp", {
		adminOnly = true,
		syntax = "<string target | bool toAimPos>",
		onRun = function(client, arguments)
			local target = nut.command.findPlayer(client, arguments[1])
			local position = client:GetEyeTraceNoCursor().HitPos
			local toAimPos = util.tobool(arguments[1])

			if (!toAimPos) then
				local data = {}
					data.start = client:GetShootPos() + client:GetAimVector() * 32
					data.endpos = client:GetShootPos() + client:GetAimVector() * 72
					data.filter = client
				local trace = util.TraceLine(data)

				position = trace.HitPos
			end

			if (position) then
				target:SetPos(position)
				client:notify(client:Name().." has teleported "..target:Name().." to "..(toAimPos and "their aim position" or "their position")..".")
			else
				client:notify(target:Name().." could not be teleported.")
			end
		end
	})

	nut.command.add("tpa", {
		adminOnly = true,
		syntax = "<string target | bool toAimPos>",
		onRun = function(client, arguments)
			local target = nut.command.findPlayer(client, arguments[1])
			local position = target:GetEyeTraceNoCursor().HitPos
			local toAimPos = util.tobool(arguments[1])

			if (!toAimPos) then
				local data = {}
					data.start = target:GetShootPos() + target:GetAimVector() * 32
					data.endpos = target:GetShootPos() + target:GetAimVector() * 72
					data.filter = target
				local trace = util.TraceLine(data)

				position = trace.HitPos
			end

			if (position) then
				client:SetPos(position)
				client:notify(client:Name().." has teleported to "..target:Name().."'s "..(toAimPos and "aim position" or "position")..".")
			else
				client:notify("A position could not be found for you.", client)
			end
		end
	})
