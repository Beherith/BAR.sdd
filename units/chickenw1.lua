return {
	chickenw1 = {
		acceleration = 2,
		airsightdistance = 600,
		amphibious = true,
		bankscale = "1",
		brakerate = 0.2,
		buildcostenergy = 2200,
		buildcostmetal = 72,
		builder = false,
		buildpic = "CHICKENW1.DDS",
		buildtime = 1300,
		cancrash = false,
		canfly = true,
		canguard = true,
		canland = true,
		canmove = true,
		canpatrol = true,
		canstop = true,
		cansubmerge = false,
		category = "VTOL MOBILE WEAPON NOTSUB NOTSHIP NOTHOVER ALL",
		collide = false,
		collisionvolumeoffsets = "0 7 -6",
		collisionvolumescales = "48 12 22",
		collisionvolumetype = "box",
		cruisealt = 100,
		description = "Flying Spike Spitter",
		explodeas = "TALON_DEATH",
		floater = true,
		footprintx = 1,
		footprintz = 1,
		hidedamage = 1,
		icontype = "chickenf",
		idleautoheal = 2,
		idletime = 0,
		maneuverleashlength = "1280",
		mass = 90,
		maxdamage = 295,
		maxvelocity = 10,
		moverate1 = "32",
		name = "Claw",
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "chicken_pidgeon.s3o",
		seismicsignature = 0,
		selfdestructas = "TALON_DEATH",
		separation = "0.2",
		sightdistance = 360,
		turninplace = 0,
		turnrate = 3200,
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
				accuracy = 200,
				areaofeffect = 32,
				avoidfriendly = false,
				burnblow = true,
				collidefriendly = false,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:dirt",
				impulseboost = 0,
				impulsefactor = 0.4,
				interceptedbyshieldtype = 0,
				model = "spike.s3o",
				name = "Spike",
				noselfdamage = true,
				range = 400,
				reloadtime = 2.2,
				soundstart = "talonattack",
				startvelocity = 200,
				submissile = 1,
				turret = true,
				waterweapon = true,
				weaponacceleration = 100,
				weapontimer = 1,
				weaponvelocity = 425,
				damage = {
					default = 140,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "WEAPON",
				def = "WEAPON",
				maindir = "0 0 1",
				maxangledif = 120,
			},
		},
	},
}
