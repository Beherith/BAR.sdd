return {
	cormist = {
		acceleration = 0.027,
		airsightdistance = 900,
		brakerate = 0.0495,
		buildcostenergy = 2322,
		buildcostmetal = 156,
		buildpic = "CORMIST.DDS",
		buildtime = 3435,
		canmove = true,
		category = "ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		corpse = "DEAD",
		description = "Missile Truck",
		energymake = 0.5,
		energyuse = 0.5,
		explodeas = "BIG_UNITEX",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		maxdamage = 777,
		maxslope = 16,
		maxvelocity = 1.5,
		maxwaterdepth = 12,
		movementclass = "TANK3",
		name = "Slasher",
		objectname = "CORMIST.s3o",
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 620,
		trackoffset = -6,
		trackstrength = 5,
		tracktype = "corwidetracks",
		trackwidth = 30,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.99,
		turnrate = 370,
		customparams = {
			faction = "core",
			normalmaps = "yes",
			normaltex = "unittextures/Core_normal.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-0.41771697998 -0.356536877441 1.65004730225",
				collisionvolumescales = "31.3571624756 22.0425262451 48.4261016846",
				collisionvolumetype = "Box",
				damage = 672,
				description = "Slasher Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				hitdensity = 100,
				metal = 100,
				object = "CORMIST_DEAD.s3o",
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
				damage = 336,
				description = "Slasher Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 46,
				object = "cor3x3f.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
				customparams = {
			techlevel = 1,
					faction = "core",
				},
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:rocketflare",
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
				[1] = "vcormove",
			},
			select = {
				[1] = "vcorsel",
			},
		},
		weapondefs = {
			cortruck_missile = {
				areaofeffect = 48,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH2ND",
				firestarter = 70,
				flighttime = 3.5,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				metalpershot = 0,
				model = "cormissile.s3o",
				name = "Missiles",
				noselfdamage = true,
				range = 600,
				reloadtime = 2.5,
				smoketrail = true,
				soundhit = "xplomed2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.5,
				soundstart = "rockhvy2",
				startvelocity = 450,
				texture2 = "coresmoketrail",
				tolerance = 8000,
				tracks = true,
				turnrate = 63000,
				turret = true,
				weaponacceleration = 109,
				weapontimer = 5,
				weapontype = "MissileLauncher",
				weaponvelocity = 545,
				damage = {
					bombers = 120,
					commanders = 32,
					default = 47,
					fighters = 120,
					subs = 5,
					vtol = 120,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "NOTAIR",
				def = "CORTRUCK_MISSILE",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
