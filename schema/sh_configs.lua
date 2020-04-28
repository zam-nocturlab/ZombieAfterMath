WEAPON_REQSKILLS = {}

-- Add Item Stat Requirements.
local function addRequire(itemID, reqAttribs)
        WEAPON_REQSKILLS[itemID] =  reqAttribs
end

-- Adding Weapon Requirements.
addRequire("ak47", {gunskill = 3})
addRequire("aug", {gunskill = 5})
addRequire("deagle", {gunskill = 5})
addRequire("famas", {gunskill = 3})
addRequire("fiveseven", {gunskill = 2})
addRequire("galil", {gunskill = 3})
addRequire("m4a1", {gunskill = 5})
addRequire("mac10", {gunskill = 3})
addRequire("mp5", {gunskill = 4})
addRequire("p228", {gunskill = 1})
addRequire("p90", {gunskill = 4})
addRequire("sg552", {gunskill = 5})
addRequire("tmp", {gunskill = 3})
addRequire("ump", {gunskill = 3})
addRequire("usp", {gunskill = 2})

-- Adding Medical Requirements
addRequire("healthkit", {medical = 7})
addRequire("healvial", {medical = 3})

