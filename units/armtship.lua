return {
	armtship = {
		acceleration = 0.09,
		autoheal = 5,
		brakerate = 0.27,
		buildangle = 16384,
		buildcostenergy = 6655,
		buildcostmetal = 784,
		buildpic = "ARMTSHIP.DDS",
		buildtime = 10176,
		canattack = false,
		canmove = true,
		category = "ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR NOTHOVER SURFACE",
		corpse = "DEAD",
		description = "Armored Transport Ship",
		explodeas = "BIG_UNITEX",
		floater = true,
		footprintx = 4,
		footprintz = 4,
		icontype = "sea",
		loadingradius = 250,
		maxdamage = 11010,
		maxvelocity = 3.34,
		minwaterdepth = 1,
		movementclass = "DBOAT6",
		name = "Hulk",
		nochasecategory = "ALL",
		objectname = "ARMTSHIP.s3o",
		pushresistant = true,
		releaseheld = false,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 550,
		transportcapacity = 40,
		transportsize = 4,
		transportunloadmethod = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 2.2044,
		turnrate = 420,
		unloadspread = 1,
		waterline = 11,
		windgenerator = 0.001,
		customparams = {
			faction = "arm",
			normalmaps = "yes",
			normaltex = "unittextures/Arm_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "4.52877807617 1.04003906216e-05 -9.52276611328",
				collisionvolumescales = "68.6154174805 110.103820801 132.778900146",
				collisionvolumetype = "Box",
				damage = 6606,
				description = "Hulk Wreckage",
				energy = 0,
				featuredead = "HEAP",
				footprintx = 5,
				footprintz = 5,
				height = 4,
				hitdensity = 100,
				metal = 597,
				object = "armtship_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
				customparams = {
					faction = "arm",
				},
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 2016,
				description = "Hulk Heap",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 209,
				object = "arm5x5a.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
				customparams = {
			techlevel = 1,
					faction = "arm",
				},
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:shallow_water_dirt",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "sharmmov",
			},
			select = {
				[1] = "sharmsel",
			},
		},
	},
}
