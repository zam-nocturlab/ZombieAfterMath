nut.crafting = nut.crafting or {}
nut.crafting.list = nut.crafting.list or {}

function nut.crafting.loadFromDir(directory)
	for k, v in ipairs(file.Find(directory.."/*.lua", "LUA")) do
		local niceName = v:sub(4, -5)

		CRAFTING = nut.crafting.list[niceName] or {}
			if (PLUGIN) then
				CRAFTING.plugin = PLUGIN.uniqueID
			end

			CRAFTING.name = CRAFTING.name or ""
			CRAFTING.recipe = CRAFTING.recipe or {}
			CRAFTING.result = CRAFTING.result or {}

			nut.util.include(directory.."/"..v)

			nut.crafting.list[niceName] = CRAFTING
		CRAFTING = nil
	end
end

hook.Add("DoPluginIncludes", "nutCraftingLib", function(path)
	nut.crafting.loadFromDir(path.."/recipes")
end)
