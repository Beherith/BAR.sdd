return {
	chickenh5 = {
		acceleration = 0.8,
		autoheal = 8,
		brakerate = 0.8,
		buildcostenergy = 5201,
		buildcostmetal = 251,
		builddistance = 425,
		builder = true,
		buildpic = "CHICKENH5.DDS",
		buildtime = 12000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canreclaim = false,
		canrestore = false,
		canstop = "1",
		category = "MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ALL NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 10 2",
		collisionvolumescales = "37 55 90",
		collisionvolumetype = "box",
		corpse = "DEAD",
		description = "Chicken Overseer",
		explodeas = "BIGBUG_DEATH",
		floater = false,
		footprintx = 3,
		footprintz = 3,
		hidedamage = 1,
		icontype = "chicken",
		leavetracks = true,
		maneuverleashlength = 640,
		mass = 3000,
		maxdamage = 8000,
		maxslope = 18,
		maxvelocity = 3.7,
		maxwaterdepth = 15,
		movementclass = "AKBOT2",
		name = "Patriarch",
		nanocolor = "0.7 0.15 0.15",
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "brain_bug.s3o",
		repairspeed = 450,
		selfdestructas = "BUG_DEATH",
		sightdistance = 760,
		trackoffset = 0,
		trackstrength = 8,
		trackstretch = 1,
		tracktype = "ChickenTrack",
		trackwidth = 18,
		turninplace = 0,
		turnrate = 1300,
		upright = false,
		waterline = 8,
		workertime = 450,
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
				[4] = "custom:BRAIN_SPHERE_EMIT",
			},
		},
		weapondefs = {
			controlblob = {
				areaofeffect = 80,
				avoidfeature = 0,
				avoidfriendly = 0,
				camerashake = 0,
				cegtag = "blood_trail",
				collidefriendly = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.25,
				explosiongenerator = "custom:control_explode",
				impulseboost = 0,
				impulsefactor = 0,
				intensity = 0.7,
				interceptedbyshieldtype = 0,
				name = "ControlBlob",
				noselfdamage = true,
				predictboost = 1,
				proximitypriority = -2,
				range = 590,
				reloadtime = 9.5,
				rgbcolor = "0.7 0.15 0.15",
				size = 18,
				sizedecay = -0.3,
				soundhit = "junohit2edit",
				tolerance = 5000,
				turret = true,
				weapontimer = 3,
				weaponvelocity = 420,
				damage = {
					chicken = 10,
					default = 225,
					tinychicken = 10,
				},
			},
			weapon = {
				areaofeffect = 72,
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
				range = 165,
				reloadtime = 4,
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
					chicken = 200,
					default = 900,
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
			[2] = {
				def = "CONTROLBLOB",
				maindir = "0 0 1",
				maxangledif = 120,
				onlytargetcategory = "NOTAIR",
			},
		},
	},
}
