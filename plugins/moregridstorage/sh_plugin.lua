PLUGIN.name = "More Grid Storage"
PLUGIN.author = "Shiishii"
PLUGIN.desc = "Store items inside more grid inventory."

local INV_TYPE_ID = "grid"

STORAGE_DEFINITIONS = STORAGE_DEFINITIONS or {}
STORAGE_DEFINITIONS["models/props_lab/filecabinet02.mdl"] = {
	name = "File cabinet",
	desc = "A metal Filecabinet storage.",
	invType = INV_TYPE_ID,
	invData = {
		w = 1,
		h = 2
	}
}
STORAGE_DEFINITIONS["models/props_wasteland/controlroom_filecabinet001a.mdl"] = {
	name = "File cabinet",
	desc = "A metal Filecabinet storage.",
	invType = INV_TYPE_ID,
	invData = {
		w = 1,
		h = 2
	}
}
STORAGE_DEFINITIONS["models/props_wasteland/controlroom_filecabinet002a.mdl"] = {
	name = "File cabinet",
	desc = "A metal Filecabinet storage.",
	invType = INV_TYPE_ID,
	invData = {
		w = 1,
		h = 4
	}
}
STORAGE_DEFINITIONS["models/props_wasteland/controlroom_storagecloset001a.mdl"] = {
	name = "Closet storage",
	desc = "A metal Closet storage.",
	invType = INV_TYPE_ID,
	invData = {
		w = 2,
		h = 5
	}
}
STORAGE_DEFINITIONS["models/props_wasteland/controlroom_storagecloset001b.mdl"] = {
	name = "Closet storage",
	desc = "A metal Closet storage.",
	invType = INV_TYPE_ID,
	invData = {
		w = 2,
		h = 5
	}
}
