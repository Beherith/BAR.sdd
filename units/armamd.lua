return {
	armamd = {
		acceleration = 0,
		brakerate = 0,
		buildangle = 4096,
		buildcostenergy = 38400,
		buildcostmetal = 1493,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 5,
		buildinggrounddecalsizey = 5,
		buildinggrounddecaltype = "armamd_aoplane.dds",
		buildpic = "ARMAMD.DDS",
		buildtime = 60000,
		canattack = false,
		category = "ALL NOTLAND WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		corpse = "DEAD",
		damagemodifier = 0.5,
		description = "Anti-Nuke System",
		explodeas = "LARGE_BUILDINGEX",
		footprintx = 4,
		footprintz = 3,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 3300,
		maxslope = 10,
		maxwaterdepth = 0,
		name = "Protector",
		objectname = "ARMAMD.s3o",
		radardistance = 50,
		script = "armamd.cob",
		seismicsignature = 0,
		selfdestructas = "LARGE_BUILDING",
		sightdistance = 201,
		usebuildinggrounddecal = true,
		yardmap = "oooooooooooooooo",
		customparams = {
			faction = "arm",
			normalmaps = "yes",
			normaltex = "unittextures/Arm_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "11.7913818359 -7.62939453125e-06 -0.808395385742",
				collisionvolumescales = "51.5827331543 42.1249847412 61.0397644043",
				collisionvolumetype = "Box",
				damage = 1980,
				description = "Protector Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 5,
				footprintz = 6,
				height = 20,
				hitdensity = 100,
				metal = 934,
				object = "armamd_dead.s3o",
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
				damage = 990,
				description = "Protector Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 5,
				footprintz = 5,
				height = 4,
				hitdensity = 100,
				metal = 374,
				object = "arm5x5b.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
				customparams = {
			techlevel = 2,
					faction = "arm",
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
				[1] = "loadwtr2",
			},
			select = {
				[1] = "loadwtr2",
			},
		},
		weapondefs = {
			amd_rocket = {
				areaofeffect = 420,
				avoidfeature = false,
				avoidfriendly = false,
				collidefriendly = false,
				coverage = 2000,
				craterareaofeffect = 420,
				craterboost = 0,
				cratermult = 0,
				energypershot = 7500,
				explosiongenerator = "custom:FLASH4",
				firestarter = 100,
				flighttime = 120,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				interceptor = 1,
				metalpershot = 150,
				model = "fmdmissile.s3o",
				name = "Rocket",
				noselfdamage = true,
				range = 72000,
				reloadtime = 2,
				smoketrail = true,
				soundhit = "xplomed4",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.5,
				soundstart = "Rockhvy1",
				stockpile = true,
				stockpiletime = 90,
				tolerance = 4000,
				tracks = true,
				turnrate = 130000,
				weaponacceleration = 150,
				weapontimer = 2,
				weapontype = "StarburstLauncher",
				weaponvelocity = 6000,
				damage = {
					default = 1500,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "ALL",
				def = "AMD_ROCKET",
			},
		},
	},
}
