local PANEL = {}

local traits = {}
traits[1] = {"Speed Runner", "You've practice running so far so you can run even if you're exhausted."}
traits[2] = {"Fat", "You're fat. You have a large fat reserve so you don't starve to death."}
traits[3] = {"Immunized", "You miraculously came back from the dead at the time of infection. So you're immune to gas and zombie bites."}
traits[4] = {"Revitalizing", "Your cells are truly incredible. You regenerate yourself over time."}

function PANEL:Init()
	self.title = self:addLabel("Select a trait")

	self.faction = self:Add("DComboBox")
	self.faction:SetFont("nutCharButtonFont")
	self.faction:Dock(TOP)
	self.faction:DockMargin(0, 4, 0, 0)
	self.faction:SetTall(40)
	self.faction.Paint = function(faction, w, h)
		nut.util.drawBlur(faction)
		surface.SetDrawColor(0, 0, 0, 100)
		surface.DrawRect(0, 0, w, h)
	end
	self.faction:SetTextColor(color_white)
	self.faction.OnSelect = function(faction, index, value, id)
		self:onTraitSelected(index)
	end

	self.desc = self:addLabel("desc")
	self.desc:DockMargin(0, 8, 0, 0)
	self.desc:SetFont("nutCharSubTitleFont")
	self.desc:SetWrap(true)
	self.desc:SetAutoStretchVertical(true)
	self.desc:SetText("")

	for index, trait in pairs(traits) do
		self.faction:AddChoice(trait[1])
	end
end

function PANEL:onTraitSelected(trait)
	for k, v in pairs(traits) do
		if k == trait then
			self.desc:SetText(v[2])
			self:setContext("trait", trait)
		end
	end
	nut.gui.character:clickSound()
end

vgui.Register("nutCharacterTraits", PANEL, "nutCharacterCreateStep")
