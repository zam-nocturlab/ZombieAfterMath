--VERSION SUPPORT: 1.1, 1.1-beta

PLUGIN.name = "Crafting"
PLUGIN.author = "Pilot"
PLUGIN.desc = "Light crafting system."

if (SERVER) then
	util.AddNetworkString("nutCraftingUpdateInventory")

	net.Receive("nutCraftingUpdateInventory", function(len, client)
		local result = net.ReadString()
		local requirements = net.ReadTable()
		local inventory = client:getChar():getInv()

		for k, requirement in pairs(requirements) do
			local items = inventory:getItemsOfType(requirement[1])

			for i = 1, requirement[2] do
				inventory:removeItem(items[i].id, false)
			end

			inventory:add(result, 1)
		end

		client:notify("Item successfully created!")
	end)
end