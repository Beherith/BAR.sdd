return {
	corssub = {
		acceleration = 0.028000000864267,
		activatewhenbuilt = true,
		brakerate = 0.1879999935627,
		buildcostenergy = 11940,
		buildcostmetal = 1757,
		buildpic = "CORSSUB.DDS",
		buildtime = 23007,
		canmove = true,
		category = "ALL UNDERWATER MOBILE WEAPON NOTLAND NOTAIR NOTHOVER",
		collisionvolumeoffsets = "0 -2 0",
		collisionvolumescales = "52 16 67",
		collisionvolumetest = 1,
		collisionvolumetype = "Ell",
		corpse = "DEAD",
		description = "Battle Submarine",
		energymake = 15,
		energyuse = 15,
		explodeas = "BIG_UNITEX",
		footprintx = 3,
		footprintz = 3,
		icontype = "sea",
		idleautoheal = 15,
		idletime = 900,
		maxdamage = 2320,
		maxvelocity = 2.5899999141693,
		minwaterdepth = 20,
		movementclass = "UBOAT3",
		name = "Leviathan",
		nochasecategory = "VTOL",
		objectname = "CORSSUB.s3o",
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 520,
		sonardistance = 550,
		turnrate = 395,
		upright = true,
		waterline = 30,
		customparams = {
			normalmaps = "yes",
			normaltex = "unittextures/Core_normal.tga",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "-6.04158782959 -4.50195312496e-06 -0.0",
				collisionvolumescales = "39.0926055908 13.0902709961 63.9697265625",
				collisionvolumetype = "Box",
				damage = 1172,
				description = "Leviathan Wreckage",
				energy = 0,
				featuredead = "HEAP",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 1202,
				object = "CORSSUB_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 2016,
				description = "Leviathan Heap",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 376,
				object = "cor2X2A.s3o",
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
				[1] = "sucormov",
			},
			select = {
				[1] = "sucorsel",
			},
		},
		weapondefs = {
			corssub_weapon = {
				areaofeffect = 16,
				avoidfriendly = false,
				burnblow = true,
				collidefriendly = false,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH3",
				impulseboost = 0.12300000339746,
				impulsefactor = 0.12300000339746,
				model = "coradvtorpedo.s3o",
				name = "advTorpedo",
				noselfdamage = true,
				range = 690,
				reloadtime = 1.5,
				soundhit = "xplodep1",
				soundstart = "torpedo1",
				startvelocity = 150,
				tolerance = 32767,
				tracks = true,
				turnrate = 1500,
				turret = true,
				waterweapon = true,
				weaponacceleration = 25,
				weapontimer = 4,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 220,
				damage = {
					default = 500,
					subs = 250,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "HOVER NOTSHIP",
				def = "CORSSUB_WEAPON",
				maindir = "0 0 1",
				maxangledif = 75,
				onlytargetcategory = "NOTHOVER",
			},
		},
	},
}
