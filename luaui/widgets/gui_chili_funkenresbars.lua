function widget:GetInfo()
	return {
		name		    = "Funks resource bar",
		desc		    = "Simple chili resource bars",
		author		  = "Funkencool",
		date		    = "2013",
		license   = "GPL v3",
		layer		   = math.huge,
		enabled   = true,
	}
end

local Chili, window0, control0, metalShare, energyMeter, energyShare
local meter = {}
local incomeLabel = {}
local shareLevel = {}
local spGetTeamResources = Spring.GetTeamResources
local myTeamID = Spring.GetMyTeamID()


local function initWindow()
	local screen0 = Chili.Screen0
	local _,_,_,_,_,mShare = spGetTeamResources(myTeamID, "metal")
	local _,_,_,_,_,eShare = spGetTeamResources(myTeamID, "energy")
	
	window0 = Chili.Window:New{parent = screen0, right = 0, y = 0, width = 800, height = 20, minHeight = 20, padding = {0,0,0,0}}
	
	meter["metal"] = Chili.Progressbar:New{parent = window0, x = 90, height = 10, bottom = 5, right = 400}
	meter["energy"] = Chili.Progressbar:New{parent = window0, x = 500, height = 10, bottom = 5, right = 0}
	-- shareLevel["metal"] = Chili.Trackbar:New{parent = window0, x = 90, height = 10, bottom = 5, width = 300, value = mShare*100}
	-- shareLevel["energy"] = Chili.Trackbar:New{parent = window0, x = 500, height = 10, bottom = 5, width = 300, value = eShare*100}
	incomeLabel["metal"] = Chili.Label:New{caption = "", right = 710, bottom = 4, parent = window0, align = "right"}
	incomeLabel["energy"] = Chili.Label:New{caption = "", right = 300, bottom = 4, parent = window0, align = "right"}
	Chili.Label:New{caption = "Metal:", x = 5, y = 2, parent = window0}
	Chili.Label:New{caption = "Energy:", x = 405, y = 2, parent = window0}
end

local function setBar(res)
	local currentLevel, storage, pull, income, expense, share = spGetTeamResources(myTeamID, res)
	if income-expense > 0 then
		incomeLabel[res].font.color = {0.5,1,0.0,1}
		incomeLabel[res].font.outlineColor = {0.5,1,0.0,0.2}
		incomeLabel[res]:SetCaption("+"..math.floor(income-expense).."/s")
		meter[res]:SetColor(0.5,1,0.0,.6)
	else
		incomeLabel[res].font.color = {1,0.5,0,1}
		incomeLabel[res].font.outlineColor = {1,0.5,0,0.2}
		incomeLabel[res]:SetCaption(math.floor(income-expense).."/s")
		meter[res]:SetColor(1,0.5,0,.6)
	end
--	Spring.SetShareLevel(res, shareLevel[res].value/100)
	meter[res]:SetValue(currentLevel/storage*100)
	meter[res]:SetCaption(math.floor(currentLevel).."/"..storage)
end

function widget:GameFrame(n)
	if n%10 == 0 then
		setBar("metal")
		setBar("energy")
	end
end

function widget:Initialize()
	Spring.SendCommands("resbar 0")
	Chili = WG.Chili
	initWindow()
end