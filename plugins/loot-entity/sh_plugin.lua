PLUGIN.name = "Map loot"
PLUGIN.author = "Shiishii"
PLUGIN.desc = "This plugin transform each map entity that look like a container into a loot container and made it generate items."

local entityMeta = FindMetaTable("Entity")

function entityMeta:isLootEntity()
	local class = self:GetClass()

	return (class == "nut_lootEntity")
end

if (CLIENT) then
	--[[-------------------------------------------------------------------------
	Purpose: When we press E on the entity, we want it to open up our custom inventory
	and our own inventory.
	---------------------------------------------------------------------------]]
	netstream.Hook("invOpen", function(entity, index)
		local inventory = nut.item.inventories[index] --The entity's inventory
		local inventory2 = LocalPlayer():getChar():getInv() --Our inventory

		local playerInv = inventory2:show()
		playerInv:SetTitle("Player Inventory")
		playerInv:ShowCloseButton(false)
		
		local customInv = inventory:show()
		customInv:ShowCloseButton(true)
		customInv:SetTitle("Loot crate")
		customInv:MoveLeftOf(playerInv, 4)
		customInv.OnClose = function(this)
			if (IsValid(playerInv) and !IsValid(nut.gui.menu)) then
				playerInv:Remove()
			end
			
			netstream.Start("invExit")
		end

		nut.gui["inv"..index] = customInv
	end)
else
	--[[-------------------------------------------------------------------------
	Purpose: Load all of the data that we saved earlier.
	---------------------------------------------------------------------------]]
	function PLUGIN:LoadData()
		local savedTable = self:getData() or {}

		for k, v in ipairs(savedTable) do
			local customInv = ents.Create(v.class)
			customInv:SetPos(v.pos)
			customInv:SetAngles(v.ang)
			customInv:Spawn()
			customInv:Activate()
		end
	end

--[[-------------------------------------------------------------------------
Purpose: Save the class of the entity, position, and angle so that when we
restart the server we can get its location. These will end up saving in
garrysmod/data/*schema-name*/
---------------------------------------------------------------------------]]
	function PLUGIN:SaveData()
		local savedTable = {}

		for k, v in ipairs(ents.GetAll()) do
			if (v:isLootEntity()) then
				table.insert(savedTable, {class = v:GetClass(), pos = v:GetPos(), ang = v:GetAngles()})
			end
		end

		self:setData(savedTable)
	end
end
