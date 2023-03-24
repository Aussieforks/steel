local steel_item = "default:steel_ingot"
local steel_block = "default:steelblock"

if minetest.get_modpath("mcl_core") then
	steel_item = "mcl_core:iron_ingot"
	steel_block = "mcl_core:iron_block"
elseif minetest.get_modpath("fl_ores") then
	steel_item = "fl_ores:iron_ingot"
	steel_block = "fl_ores:iron_block"
end

-- intra-mod recipes
minetest.register_craft({
	type = "cooking",
	output = "steel:plate_hard",
	recipe = "steel:plate_soft",
})

minetest.register_craft({
	type = "cooking",
	output = "steel:grate_hard",
	recipe = "steel:grate_soft",
})

-- intra-mod recycling
minetest.register_craft({
	output = "steel:scrap 2",
	recipe = {{"steel:strut"}}
})

minetest.register_craft({
	output = "steel:scrap 2",
	recipe = {{"steel:strut_mount"}}
})

minetest.register_craft({
	output = "steel:scrap 2",
	recipe = {{"steel:grate_soft"}}
})

minetest.register_craft({
	output = "steel:scrap 2",
	recipe = {{"steel:grate_hard"}}
})

minetest.register_craft({
	output = "steel:scrap",
	recipe = {{"steel:roofing"}}
})

minetest.register_craft({
	output = "steel:scrap 4",
	recipe = {{"steel:plate_soft"}}
})

minetest.register_craft({
	output = "steel:scrap 4",
	recipe = {{"steel:plate_hard"}}
})

minetest.register_craft({
	output = "steel:scrap 3",
	recipe = {{"steel:plate_rusted"}}
})

-- extra-mod compatibility
if minetest.get_modpath("default") then
	minetest.register_craft({
		output = "steel:plate_soft 2",
		recipe = {
			{steel_item, steel_item},
			{steel_item, steel_item},
		}
	})

	minetest.register_craft({
		output = "steel:grate_soft 3",
		recipe = {
			{steel_item, "", steel_item},
			{steel_item, "", steel_item},
		}
	})

	minetest.register_craft({
		output = "steel:roofing 6",
		recipe = {{steel_item, steel_item, steel_item}}
	})

	minetest.register_craft({
		output = "steel:strut_mount",
		recipe = {{"steel:strut", steel_item}}
	})

	minetest.register_craft({
		output = "steel:strut_mount",
		recipe = {{"streets:steel_support", steel_item}}
	})

	minetest.register_craft({
		output = "default:iron_lump",
		recipe = {{"steel:scrap", "steel:scrap"}}
	})
end

if minetest.get_modpath("technic") then
	-- balance scrap recycling due to dust duplication
	minetest.clear_craft({recipe={{"steel:scrap","steel:scrap"}}})
	technic.register_grinder_recipe({input = {"steel:scrap 2"}, output="technic:wrought_iron_dust"})
	
	--use a semi-realistic crafting method
	minetest.clear_craft({output="steel:roofing"})
	technic.register_compressor_recipe({input = {steel_item.." 6"}, output = "steel:roofing"})
	
	minetest.clear_craft({output="steel:plate_soft"})
	technic.register_compressor_recipe({input = {steel_block}, output = "steel:plate_soft"})
end

if not minetest.get_modpath("streets") or not minetest.get_modpath("steelsupport") then
	minetest.register_craft({
		output = "steel:strut 5",
		recipe = {
			{"", steel_item, ""},
			{steel_item, steel_item, steel_item},
			{"", steel_item, ""},
		}
	})
end

if minetest.get_modpath("moreblocks") then
	stairsplus:register_panel("steel","roofing","steel:roofing", {
		description = "Corrugated Steel Roofing",
		tiles = {"steel_corrugated_steel.png"},
		groups = {bendy = 2, snappy = 1, dig_immediate = 2, dig_generic = 1},
		}
	)
	stairsplus:register_slab("steel","roofing","steel:roofing", {
		description = "Corrugated Steel Roofing",
		tiles = {"steel_corrugated_steel.png"},
		groups = {bendy = 2, snappy = 1, dig_immediate = 2, dig_generic = 1},
		}
	)
	stairsplus:register_slope("steel","roofing","steel:roofing", {
		description = "Corrugated Steel Roofing",
		tiles = {"steel_corrugated_steel.png"},
		groups = {bendy = 2, snappy = 1, dig_immediate = 2, dig_generic = 1},
		}
	)
end
