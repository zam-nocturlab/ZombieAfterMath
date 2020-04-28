local PANEL = {}
	function PANEL:Init()
		self:SetSize(self:GetParent():GetWide(), self:GetParent():GetTall())

		self.scroll = self:Add("DScrollPanel")
		self.scroll:Dock(LEFT)
		self.scroll:SetWide(self:GetParent():GetWide() * 0.25)
		self.scroll.Paint = function(panel, w, h)
			surface.SetDrawColor(0, 0, 0, 200)
			surface.DrawRect(0, 0, w, h)
		end

		self:loadItems()

		self.model = self:Add("DModelPanel")
		self.model:Dock(FILL)
		self.model:SetLookAt(Vector(0, 0, 0))

		self.craft = self:Add("DButton")
		self.craft:Dock(BOTTOM)
		self.craft:SetText("Craft")
		self.craft:SetDisabled(true)
		self.craft.DoClick = function()
			net.Start("nutCraftingUpdateInventory")
			net.WriteString(self.chosen)
			net.WriteTable(self.requirements)
			net.SendToServer()

			timer.Simple(0.1, function()
				self:loadItems()
			end)
		end
	end

	function PANEL:loadItems()
		self.scroll:Clear()

		self.chosen = nil
		self.requirements = nil

		self.inventory = LocalPlayer():getChar():getInv()

		for k, recipe in pairs(nut.crafting.list) do
			local itemTable = nut.item.list[recipe.result[1]]

			local requirements = ""
			for k, requirement in ipairs(recipe.recipe) do
				if k > 1 then
					requirements = requirements..", "
				end
				requirements = requirements..requirement[1].." x"..requirement[2]
			end

			local button = self.scroll:Add("DButton")
			button:Dock(TOP)
			button:DockMargin(4, 4, 4, 4)
			button:SetTall(30)
			button:SetText(recipe.name)
			button:SetToolTip(requirements)
			button:SetDisabled(true)
			button.DoClick = function(panel)
				self.model:SetModel(itemTable.model)
				self.chosen = itemTable.uniqueID
				self.requirements = recipe.recipe
				self.craft:SetDisabled(false)
			end

			for k, requirement in ipairs(recipe.recipe) do
				if self.inventory:getItemCount(requirement[1]) < requirement[2] then
					continue
				end

				if k == #recipe.recipe then
					button:SetDisabled(false)
				end
			end
		end
	end
vgui.Register("nutCrafting", PANEL, "EditablePanel")

hook.Add("CreateMenuButtons", "nutCrafting", function(tabs)
	tabs["Crafting"] = function(panel)
		panel:Add("nutCrafting")
	end
end)

net.Receive("nutCraftingUpdateInventoryHandshake", function()
	local panel = net.ReadTable()

	panel:loadItems()
end)
