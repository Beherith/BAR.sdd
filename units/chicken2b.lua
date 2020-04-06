return {
	chicken2b = {
		acceleration = 0.7,
		autoheal = 20,
		brakerate = 5,
		buildcostenergy = 1000,
		buildcostmetal = 150,
		builder = false,
		buildpic = "CHICKEN2B.DDS",
		buildtime = 7000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		category = "MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ALL NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "20 29 44",
		collisionvolumetype = "box",
		corpse = "DEAD",
		description = "Apex Swarmer",
		explodeas = "BUG_DEATH",
		floater = false,
		footprintx = 2,
		footprintz = 2,
		icontype = "chicken",
		leavetracks = true,
		maneuverleashlength = 640,
		mass = 1200,
		maxdamage = 3600,
		maxslope = 18,
		maxvelocity = 5.6,
		maxwaterdepth = 15,
		movementclass = "AKBOT2",
		name = "Chicken",
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "chicken2b.s3o",
		seismicsignature = 0,
		selfdestructas = "BUG_DEATH",
		sightdistance = 375,
		trackoffset = 0,
		trackstrength = 8,
		trackstretch = 1,
		tracktype = "ChickenTrack",
		trackwidth = 18,
		turninplace = 0,
		turnrate = 800,
		upright = false,
		waterline = 8,
		workertime = 0,
		customparams = {
			faction = "chicken",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_normal.tga",
		},
		featuredefs = {
			dead = {
				customparams = {
					faction = "chicken",
				},
			},
			heap = {
				customparams = {
			techlevel = 1,
					faction = "chicken",
				},
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
			},
		},
		weapondefs = {
			weapon = {
				areaofeffect = 32,
				avoidfeature = 0,
				avoidfriendly = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:NONE",
				impulseboost = 2.2,
				impulsefactor = 1,
				interceptedbyshieldtype = 0,
				name = "Claws",
				noselfdamage = true,
				range = 115,
				reloadtime = 0.5,
				size = 0,
				soundstart = "smallchickenattack",
				targetborder = 1,
				tolerance = 5000,
				turret = true,
				waterweapon = true,
				weapontimer = 0.1,
				weapontype = "Cannon",
				weaponvelocity = 500,
				damage = {
					chicken = 0.001,
					default = 150,
					tinychicken = 0.001,
				},
			},
		},
		weapons = {
			[1] = {
				def = "WEAPON",
				maindir = "0 0 1",
				maxangledif = 120,
				onlytargetcategory = "NOTAIR",
			},
		},
	},
}
