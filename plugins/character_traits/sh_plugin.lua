PLUGIN.name = "Traits"
PLUGIN.author = "Pilot and Shiishii"
PLUGIN.desc = "Add traits selection for character."

-- I hate the way Chessnut makes me add columns

-- And I agree with Pilot.
if (SERVER) then
	nut.db.waitForTablesToLoad()
	:next(function()
		nut.db.query("ALTER TABLE nut_characters ADD COLUMN _trait INTEGER")
		:catch(function() end)
	end)
end

nut.char.registerVar("trait", {
	field = "_trait",
	default = "",
	index = 4,
	onValidate = function(value, data, client)
		if (value) then
			if (value >= 1 && value <= 4) then
				return true
			end
		end
	end
})

-- Do something when character got a trait.
--[[
function PLUGIN:OnCharCreated(client, character)
end
]]--

function PLUGIN:ConfigureCharacterCreationSteps(panel)
	panel:addStep(vgui.Create("nutCharacterTraits"), 99)
end
