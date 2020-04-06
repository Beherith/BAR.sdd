return {
	corgate = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 2048,
		buildcostenergy = 68089,
		buildcostmetal = 3985,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 6,
		buildinggrounddecalsizey = 6,
		buildinggrounddecaltype = "corgate_aoplane.dds",
		buildpic = "CORGATE.DDS",
		buildtime = 57166,
		canattack = false,
		category = "ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		corpse = "DEAD",
		description = "Plasma Deflector",
		energystorage = 1500,
		explodeas = "CRAWL_BLAST",
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 3200,
		maxslope = 10,
		maxwaterdepth = 0,
		name = "Overseer",
		objectname = "CORGATE.s3o",
		onoffable = true,
		seismicsignature = 0,
		selfdestructas = "MINE_NUKE",
		sightdistance = 273,
		usebuildinggrounddecal = true,
		yardmap = "oooooooooooooooo",
		customparams = {
			faction = "core",
			normalmaps = "yes",
			normaltex = "unittextures/Core_normal.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0 -0.00271934814453 -1.05072021484",
				collisionvolumescales = "65.7474060059 27.1259613037 55.6685791016",
				collisionvolumetype = "Box",
				damage = 1920,
				description = "Overseer Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 2428,
				object = "CORGATE_DEAD.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
				customparams = {
					faction = "core",
				},
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 960,
				description = "Overseer Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 971,
				object = "cor2x2e.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
				customparams = {
			techlevel = 2,
					faction = "core",
				},
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
				[1] = "drone1",
			},
			select = {
				[1] = "drone1",
			},
		},
		weapondefs = {
			repulsor = {
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				name = "PlasmaRepulsor",
				range = 500,
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				weapontype = "Shield",
				damage = {
					default = 100,
				},
				shield = {
					alpha = 0.5,
					energyuse = 0,
					force = 2.5,
					intercepttype = 1,
					power = 6500,
					powerregen = 105,
					powerregenenergy = 562.5,
					radius = 500,
					repulser = true,
					smart = true,
					startingpower = 1800,
					visible = true,
					visiblehitframes = 70,
					badcolor = {
						[1] = 1,
						[2] = 0.2,
						[3] = 0.2,
					},
					goodcolor = {
						[1] = 0.2,
						[2] = 1,
						[3] = 0.2,
					},
				},
			},
		},
		weapons = {
			[1] = {
				def = "REPULSOR",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
