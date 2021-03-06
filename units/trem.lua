return {
	trem = {
		acceleration = 0.0528,
		brakerate = 0.33,
		buildcostenergy = 48373,
		buildcostmetal = 2081,
		buildpic = "TREM.DDS",
		buildtime = 31103,
		canmove = true,
		category = "ALL WEAPON NOTSUB NOTAIR NOTHOVER SURFACE",
		corpse = "DEAD",
		description = "Heavy Artillery Vehicle",
		energymake = 2.1,
		energyuse = 2.1,
		explodeas = "BIG_UNIT",
		footprintx = 4,
		footprintz = 4,
		hightrajectory = 1,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		maxdamage = 2700,
		maxslope = 14,
		maxvelocity = 1.452,
		maxwaterdepth = 15,
		movementclass = "HTANK4",
		name = "Tremor",
		nochasecategory = "VTOL",
		objectname = "TREM.s3o",
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 351,
		trackoffset = -8,
		trackstrength = 8,
		tracktype = "corwidetracks",
		trackwidth = 50,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.95832,
		turnrate = 169.39999,
		customparams = {
			faction = "core",
			normalmaps = "yes",
			normaltex = "unittextures/Core_normal.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "1.25984954834 -1.01012474365 0.475593566895",
				collisionvolumescales = "55.5426483154 42.2261505127 61.5749359131",
				collisionvolumetype = "Box",
				damage = 2000,
				description = "Tremor Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 8,
				hitdensity = 100,
				metal = 1118,
				object = "TREM_DEAD.s3o",
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
				description = "Tremor Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 2,
				hitdensity = 100,
				metal = 527,
				object = "cor2x2b.s3o",
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
			trem1 = {
				accuracy = 1400,
				areaofeffect = 160,
				avoidfeature = false,
				craterareaofeffect = 160,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH4",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "RapidArtillery",
				noselfdamage = true,
				proximitypriority = -3,
				range = 1275,
				reloadtime = 0.4,
				soundhit = "xplomed4",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.5,
				soundstart = "cannhvy2",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 414.87949,
				damage = {
					bombers = 19,
					default = 295,
					fighters = 19,
					subs = 5,
					vtol = 19,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "TREM1",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
