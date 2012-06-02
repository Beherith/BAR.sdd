return {
	corsjam = {
		acceleration = 0.096000000834465,
		activatewhenbuilt = true,
		brakerate = 0.021999999880791,
		buildcostenergy = 2254,
		buildcostmetal = 135,
		buildpic = "CORSJAM.DDS",
		buildtime = 7025,
		canmove = true,
		category = "ALL NOTLAND MOBILE NOTSUB SHIP NOWEAPON NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -4 0",
		collisionvolumescales = "31 19 71",
		collisionvolumetest = 1,
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		description = "Radar Jammer Ship",
		energymake = 20,
		energyuse = 20,
		explodeas = "SMALL_UNITEX",
		floater = true,
		footprintx = 3,
		footprintz = 3,
		icontype = "sea",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 570,
		maxvelocity = 2.8800001144409,
		minwaterdepth = 6,
		movementclass = "BOAT4",
		name = "Phantom",
		nochasecategory = "MOBILE",
		objectname = "CORSJAM.s3o",
		onoffable = true,
		radardistancejam = 900,
		seismicsignature = 0,
		selfdestructas = "SMALL_UNIT",
		sightdistance = 403,
		turninplace = 0,
		turnrate = 512,
		waterline = 2,
		windgenerator = 0.0010000000474975,
		customparams = {
			normalmaps = "yes",
			normaltex = "unittextures/Core_normal.tga",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "-3.9418182373 0.0506627246094 -0.0",
				collisionvolumescales = "41.9625549316 13.4625854492 69.8010559082",
				collisionvolumetype = "Box",
				damage = 342,
				description = "Phantom Wreckage",
				energy = 0,
				featuredead = "HEAP",
				footprintx = 4,
				footprintz = 4,
				height = 20,
				hitdensity = 100,
				metal = 88,
				object = "CORSJAM_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 2016,
				description = "Phantom Heap",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 46,
				object = "cor4X4A.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
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
				[1] = "shcormov",
			},
			select = {
				[1] = "radjam2",
			},
		},
		weapondefs = {
			bogus_ground_missile = {
				areaofeffect = 48,
				craterboost = 0,
				cratermult = 0,
				impulseboost = 0,
				impulsefactor = 0,
				metalpershot = 0,
				name = "Missiles",
				range = 800,
				reloadtime = 0.5,
				startvelocity = 450,
				tolerance = 9000,
				turnrate = 33000,
				turret = true,
				weaponacceleration = 101,
				weapontimer = 0.10000000149012,
				weapontype = "Cannon",
				weaponvelocity = 650,
				damage = {
					default = 0,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MOBILE",
				def = "BOGUS_GROUND_MISSILE",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
