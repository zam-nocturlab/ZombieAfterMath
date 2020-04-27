-- Driveable GTA Cars (TDM Base)
-- http://steamcommunity.com/sharedfiles/filedetails/?id=323285641
-- A bus to transport all of your team.

ITEM.name = "Bus"
ITEM.model = "models/tdmcars/gtav/bus.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.maxGas = 1000
ITEM.price = 35000
ITEM.vehicleData = {
	type = TYPE_GENERIC,
	model = ITEM.model,
	script = "scripts/vehicles/TDMCars/gtav/bus.txt",
	name = ITEM.name,
	physDesc = ITEM.physDesc,
	maxGas = ITEM.maxGas,
	seats = {
		{
			pos = Vector(24.720136642456, 36.258457183838, 28.553546905518),
			ang = Angle(0, 0, 0)
		},
        {
            pos = Vector(24.720136642456, 36.258457183838, 128.553546905518),
            ang = Angle(0, 0, 0)
        }
	}
}
