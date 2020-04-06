return {
	corseal = {
		acceleration = 0.0462,
		brakerate = 0.0627,
		buildcostenergy = 9067,
		buildcostmetal = 480,
		buildpic = "CORSEAL.DDS",
		buildtime = 12051,
		canmove = true,
		category = "ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 2 0",
		collisionvolumescales = "31 24 31",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		description = "Heavy Amphibious Tank",
		energymake = 0.5,
		energyuse = 0.5,
		explodeas = "BIG_UNITEX",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		maxdamage = 2340,
		maxslope = 12,
		maxvelocity = 2.645,
		maxwaterdepth = 255,
		movementclass = "ATANK3",
		name = "Croc",
		nochasecategory = "VTOL",
		objectname = "CORSEAL.s3o",
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 399,
		trackoffset = 6,
		trackstrength = 5,
		tracktype = "corwidetracks",
		trackwidth = 30,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.7457,
		turnrate = 487,
		customparams = {
			faction = "core",
			normalmaps = "yes",
			normaltex = "unittextures/Core_normal.dds",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "-0.710494995117 -1.1132812503e-06 0.9375",
				collisionvolumescales = "31.2236328125 16.1107177734 37.8449707031",
				collisionvolumetype = "Box",
				damage = 2000,
				description = "Croc Wreckage",
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 236,
				object = "CORSEAL_DEAD.s3o",
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
				damage = 1500,
				description = "Croc Heap",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 118,
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
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:DUST_CLOUD_FAST",
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
				[1] = "tcormove",
			},
			select = {
				[1] = "tcorsel",
			},
		},
		weapondefs = {
			core_croc = {
				areaofeffect = 64,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH64",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "PlasmaCannon",
				noselfdamage = true,
				range = 440,
				reloadtime = 0.9,
				soundhit = "xplomed4",
				soundhitwet = "splssml",
				soundhitwetvolume = 0.5,
				soundstart = "cannon2",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 260,
				damage = {
					bombers = 29,
					default = 116,
					fighters = 29,
					subs = 5,
					vtol = 29,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "CORE_CROC",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
