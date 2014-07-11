return {
	armplat_ba = {
		acceleration = 0,
		brakerate = 0,
		buildcostenergy = 19426,
		buildcostmetal = 2667,
		builder = true,
		buildpic = "ARMPLAT.DDS",
		buildtime = 19248,
		canmove = true,
		category = "ALL PLANT NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		corpse = "DEAD",
		description = "Builds Seaplanes",
		energystorage = 200,
		explodeas = "LARGE_BUILDINGEX",
		footprintx = 7,
		footprintz = 7,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 1820,
		metalmake = 1,
		metalstorage = 200,
		minwaterdepth = 30,
		name = "Seaplane Platform",
		objectname = "armplat_ba",
		script = "armplat_ba.cob",
		radardistance = 50,
		seismicsignature = 0,
		selfdestructas = "LARGE_BUILDING",
		sightdistance = 169,
		terraformspeed = 1000,
		waterline = 53,
		workertime = 200,
		yardmap = "wwwwwwwwCCCCCwwCCCCCwwCCCCCwwCCCCCwwCCCCCwwwwwwww",
		buildoptions = {
			[1] = "armcsa",
			[2] = "armsaber",
			[3] = "armsb",
			[4] = "armseap",
			[5] = "armsfig",
			[6] = "armsehak",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "1.25 -7.62939453125e-06 -0.375",
				collisionvolumescales = "108.669647217 46.9999847412 117.478393555",
				collisionvolumetype = "Box",
				damage = 1092,
				description = "Seaplane Platform Wreckage",
				energy = 0,
				footprintx = 7,
				footprintz = 7,
				height = 20,
				hitdensity = 100,
				metal = 1734,
				object = "ARMPLAT_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sounds = {
			build = "seaplok1",
			canceldestruct = "cancel2",
			underattack = "warning1",
			unitcomplete = "untdone",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "seaplsl1",
			},
		},
	},
}
