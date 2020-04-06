return {
	corsilo = {
		acceleration = 0,
		brakerate = 0,
		buildangle = 8192,
		buildcostenergy = 82705,
		buildcostmetal = 7666,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 10,
		buildinggrounddecalsizey = 10,
		buildinggrounddecaltype = "corsilo_aoplane.dds",
		buildpic = "CORSILO.DDS",
		buildtime = 181243,
		category = "ALL NOTLAND WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		corpse = "DEAD",
		description = "Nuclear Missile Silo",
		explodeas = "ATOMIC_BLAST",
		footprintx = 7,
		footprintz = 7,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 5560,
		maxslope = 10,
		maxwaterdepth = 0,
		name = "Silencer",
		objectname = "CORSILO.s3o",
		radardistance = 50,
		seismicsignature = 0,
		selfdestructas = "NUCLEAR_MISSILE",
		sightdistance = 455,
		usebuildinggrounddecal = true,
		yardmap = "ooooooooooooooooooooooooooooooooooooooooooooooooo",
		customparams = {
			faction = "core",
			normalmaps = "yes",
			normaltex = "unittextures/Core_normal.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0 -0.0182740600586 2.87522888184",
				collisionvolumescales = "75.0 23.7250518799 77.7504577637",
				collisionvolumetype = "Box",
				damage = 3336,
				description = "Silencer Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				hitdensity = 100,
				metal = 4672,
				object = "CORSILO_DEAD.s3o",
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
				damage = 1668,
				description = "Silencer Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 1869,
				object = "cor3x3a.s3o",
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
				[1] = "servroc1",
			},
			select = {
				[1] = "servroc1",
			},
		},
		weapondefs = {
			crblmssl = {
				areaofeffect = 1920,
				avoidfeature = false,
				avoidfriendly = false,
				collidefriendly = false,
				commandfire = true,
				craterareaofeffect = 1920,
				craterboost = 2.4,
				cratermult = 1.2,
				edgeeffectiveness = 0.3,
				energypershot = 187500,
				explosiongenerator = "custom:FLASHNUKE1920",
				firestarter = 0,
				flighttime = 400,
				impulseboost = 0.5,
				impulsefactor = 0.5,
				metalpershot = 1500,
				model = "crblmssl.s3o",
				name = "CoreNuclearMissile",
				range = 72000,
				reloadtime = 2,
				smoketrail = true,
				soundhit = "xplomed4",
				soundstart = "misicbm1",
				stockpile = true,
				stockpiletime = 180,
				targetable = 1,
				tolerance = 4000,
				turnrate = 32768,
				weaponacceleration = 100,
				weapontimer = 8,
				weapontype = "StarburstLauncher",
				weaponvelocity = 1600,
				damage = {
					commanders = 2500,
					default = 11500,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MOBILE",
				def = "CRBLMSSL",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
