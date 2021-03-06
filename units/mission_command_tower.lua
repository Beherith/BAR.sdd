return {
	mission_command_tower = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 16384,
		buildcostenergy = 100000,
		buildcostmetal = 10000,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 15,
		buildinggrounddecalsizey = 15,
		buildinggrounddecaltype = "mission_command_tower_aoplane.dds",
		buildpic = "MISSION_COMMAND_TOWER.DDS",
		buildtime = 100000,
		category = "ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		description = "",
		energymake = 750,
		energyuse = 500,
		explodeas = "BIG_BUILDINGEX",
		footprintx = 12,
		footprintz = 12,
		icontype = "building",
		idleautoheal = 5,
		idletime = 100,
		maxdamage = 10000,
		maxslope = 10,
		maxwaterdepth = 0,
		name = "Command Tower",
		objectname = "mission_command_tower.s3o",
		reclaimable = false,
		seismicsignature = 0,
		selfdestructas = "LARGE_BUILDING",
		sightdistance = 100,
		usebuildinggrounddecal = true,
		yardmap = "oooooooooooo oooooooooooo oooooooooooo oooooooooooo oooooooooooo oooooooooooo oooooooooooo oooooooooooo oooooooooooo oooooooooooo oooooooooooo oooooooooooo",
		customparams = {
			techlevel = 2,
			faction = "arm",
			normalmaps = "yes",
			normaltex = "unittextures/Arm_normals.dds",
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "geothrm1",
			},
		},
	},
}
