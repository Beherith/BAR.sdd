return {
	armamb_ba = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 8192,
		buildcostenergy = 16821,
		buildcostmetal = 2342,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 5,
		buildinggrounddecalsizey = 5,
		buildinggrounddecaltype = "armamb_aoplane.dds",
		buildpic = "ARMAMB.DDS",
		buildtime = 27072,
		category = "ALL NOTLAND WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		cloakcost = 24,
		corpse = "DEAD",
		damagemodifier = 0.25,
		description = "Cloakable Heavy Plasma Cannon",
		explodeas = "LARGE_BUILDINGEX",
		footprintx = 3,
		footprintz = 3,
		hightrajectory = 2,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 3600,
		maxslope = 10,
		maxwaterdepth = 0,
		mincloakdistance = 70,
		name = "Ambusher",
		nochasecategory = "MOBILE",
		objectname = "armamb_ba",
		script = "armamb_ba.cob",
		seismicsignature = 0,
		selfdestructas = "LARGE_BUILDING",
		sightdistance = 442,
		usebuildinggrounddecal = true,
		yardmap = "ooooooooo",
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-0.544998168945 2.61108398441e-05 -0.5",
				collisionvolumescales = "48.1152648926 38.0216522217 48.1152648926",
				collisionvolumetype = "Box",
				damage = 2160,
				description = "Ambusher Wreckage",
				energy = 0,
				featuredead = "DEAD2",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				hitdensity = 100,
				metal = 1522,
				object = "ARMAMB_DEAD1",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			dead2 = {
				blocking = true,
				category = "corpses",
				damage = 1080,
				description = "Ambusher Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				hitdensity = 100,
				metal = 609,
				object = "ARMAMB_DEAD2",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 540,
				description = "Ambusher Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 244,
				object = "3X3B",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			cloak = "kloak1",
			uncloak = "kloak1un",
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
				[1] = "twrturn3",
			},
			select = {
				[1] = "twrturn3",
			},
		},
		weapondefs = {
			armamb_gun = {
				accuracy = 400,
				areaofeffect = 152,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.25,
				explosiongenerator = "custom:FLASH96",
				gravityaffected = "true",
				impulseboost = 0.12300000339746,
				impulsefactor = 0.5,
				name = "PopupCannon",
				noselfdamage = true,
				predictboost = 0.20000000298023,
				range = 1320,
				reloadtime = 1.7999999523163,
				soundhit = "xplomed2",
				soundstart = "cannhvy5",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 450,
				damage = {
					bombers = 90,
					default = 345,
					fighters = 90,
					subs = 5,
					vtol = 90,
				},
			},
			armamb_gun_high = {
				accuracy = 400,
				areaofeffect = 224,
				craterboost = 0.12300000339746,
				cratermult = 0.12300000339746,
				edgeeffectiveness = 0.5,
				explosiongenerator = "custom:FLASH96",
				gravityaffected = "true",
				impulseboost = 0.12300000339746,
				impulsefactor = 2,
				name = "PopupCannon",
				noselfdamage = true,
				proximitypriority = -2,
				range = 1320,
				reloadtime = 7,
				soundhit = "xplomed2",
				soundstart = "cannhvy5",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 440,
				damage = {
					bombers = 90,
					commanders = 1504,
					default = 865,
					fighters = 90,
					subs = 5,
					vtol = 90,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL GROUNDSCOUT",
				def = "ARMAMB_GUN",
				maindir = "0 1 0",
				maxangledif = 230,
				onlytargetcategory = "SURFACE",
			},
			[2] = {
				badtargetcategory = "VTOL GROUNDSCOUT",
				def = "ARMAMB_GUN_HIGH",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
