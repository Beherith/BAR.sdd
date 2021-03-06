-- WIP
function widget:GetInfo()
    return {
        name      = 'Selection info',
        desc      = 'Shows information about the current selection',
        author    = 'Funkencool',
        date      = '2013',
        license   = 'GNU GPL v2',
        layer     = 0,
        enabled   = true,
    }
end

local imageDir = 'luaui/images/buildIcons/'

local Chili
local buttonColour, panelColour, sliderColour 

local relFontSize = 15
local fontSize

local screen, unitWindow, groundWindow, groundText
local unitWindow, unitName, unitPicture, unitPictureOverlay, unitHealthText, unitHealth, unitCostTextTitle, unitResText, unitFactionPic
local featureName, featureHealthText, featureHealth, featureResText
local focusName, focusPicture, focusPictureOverlay, focusCostText, focusBuildTimeText, focusFactionPic, focusKeyText
local basicHealth, basicHealthText, basicUnitText, basicResText, basicCostText
local unitGrid 
local healthBars = {}

local curTip -- general info about 
local focusDefID -- unitDefID of unit we are currently thinking of building
local mouseOverUnitID, mouseOverUnitDefID -- unitDefID of the unit the user currently has their mouse hovering over, or nil
local preferFocus -- do we prefer to display the focus window or the unit window?

local spGetTimer                = Spring.GetTimer
local spDiffTimers              = Spring.DiffTimers
local spGetUnitDefID            = Spring.GetUnitDefID
local spGetUnitTooltip          = Spring.GetUnitTooltip
local spGetActiveCommand        = Spring.GetActiveCommand
local spGetSelectedUnits        = Spring.GetSelectedUnits
local spGetUnitHealth           = Spring.GetUnitHealth
local spGetUnitTeam             = Spring.GetUnitTeam
local spGetSelectedUnitsSorted  = Spring.GetSelectedUnitsSorted
local spGetMouseState           = Spring.GetMouseState
local spTraceScreenRay          = Spring.TraceScreenRay
local spGetGroundHeight         = Spring.GetGroundHeight
local spGetGroundInfo           = Spring.GetGroundInfo
local spGetUnitResources        = Spring.GetUnitResources
local spGetSelectedUnitsCounts  = Spring.GetSelectedUnitsCounts
local spGetFeatureDefID         = Spring.GetFeatureDefID
local spGetFeatureResources     = Spring.GetFeatureResources
local spGetFeatureHealth        = Spring.GetFeatureHealth
local spGetFeatureTeam          = Spring.GetFeatureTeam
local spGetFeatureResurrect     = Spring.GetFeatureResurrect
local spValidFeatureID          = Spring.ValidFeatureID
local spGetGameFrame            = Spring.GetGameFrame

local floor = math.floor
local max = math.max
local min = math.min
local schar = string.char

local myTeamID  = Spring.GetMyTeamID()
local groundTimer = spGetTimer()


----------------------------------
-- helpers

local mColour = '\255\153\153\204'
local eColour = '\255\255\255\76'

local green = '\255\0\255\0'
local red = '\255\255\0\0'
local grey = '\255\150\150\150'
local white = '\255\255\255\255'
local blue = "\255\200\200\255"
local darkblue = "\255\100\100\255"
local yellow = "\255\255\255\0"
local lilac = "\255\200\162\200"
local tomato = "\255\255\99\71"
local turqoise = "\255\48\213\200"

local function getInline(r,g,b)
    if type(r) == 'table' then
        return string.char(255, (r[1]*255), (r[2]*255), (r[3]*255))
    else
        return string.char(255, (r*255), (g*255), (b*255))
    end
end

local function round(num, idp)
  return string.format("%." .. (idp or 0) .. "f", num)
end

local function readable(num)
    local s = ""
    if num < 0 then
        s = '-'
    elseif num < 0 then
        s = '+'
    end
    num = math.abs(num)
    if num <= 1000 then
        s = s .. round(num,1)
    elseif num >100000 then
        s = s .. round(num/1000,0)..'k'
    elseif num >1000 then
        s = s .. round(num/1000,1)..'k'
    else
        s = s .. round(num,0)
    end
    return s
end

local function ResToolTip(Mmake, Muse, Emake, Euse)
    return mColour .. "M: " .. green .. readable(Mmake) .. '  ' .. red .. readable(Muse) .. "\n" ..  eColour .. "E:  " .. green .. readable(Emake) .. '  ' .. red .. readable(Euse)
end

local function CostToolTip(Mcost, Ecost)
    return mColour .. readable(Mcost) .. '\n' .. eColour .. readable(Ecost)
end

function GetFactionPicInfo(teamID, faction)
    if not teamID or not faction then return end
    local r,g,b = Spring.GetTeamColor(teamID)
    local factionPicColour = {r,g,b,1}
    
    -- code from player list
    local dark = (r*1.2 + g*1.1 + b*0.8 < 0.9)
    if faction and (faction=='arm' or faction=='core') then
        if dark then
            factionPic = "LuaUI/Images/playerlist/"..faction.."WO_default.png"
        else
            factionPic = "LuaUI/Images/playerlist/"..faction.."_default.png"
        end
    else
        factionPic = "LuaUI/Images/playerlist/default.png"
    end
    
    return factionPic, factionPicColour
end

function GetOverlayColor(teamID)
    local r,g,b = Spring.GetTeamColor(teamID)
    local color = {r,g,b}
    local overlayColor = {} 
    overlayColor[4] = 1.0
    for i=1,3 do
        overlayColor[i] = color[i]*0.5
    end
    return overlayColor
end  

function resizeUI()
    local x = WG.UIcoords.sInfo.x
    local y = WG.UIcoords.sInfo.y
    local w = WG.UIcoords.sInfo.w
    local h = WG.UIcoords.sInfo.h
    unitWindow:SetPos(x,y,w,h)
    unitGridWindow:SetPos(x,y,w,h)
    groundWindow:SetPos(x,y,w,h)
    
    fontSize = WG.RelativeFontSize(relFontSize)
    local function SetRelFont(control)
        if control then
            control.font.size = fontSize
            control:Invalidate()
        end
    end
    
    SetRelFont(groundText)
    
    SetRelFont(unitName)
    SetRelFont(unitResText)
    SetRelFont(unitHealthText)

    SetRelFont(unitCostText)
    SetRelFont(unitResText)
    
    SetRelFont(basicUnitText)
    SetRelFont(basicCostText)
    SetRelFont(basicHealthText)
    SetRelFont(basicResText)
    
    SetRelFont(featureHealthText)
    SetRelFont(featureResText)
    SetRelFont(featureName)
    
    SetRelFont(focusName)
    SetRelFont(focusCostText)
    SetRelFont(focusKeyText)
    SetRelFont(focusBuildTimeText)
end
 
----------------------------------
-- multi-unitdef info

local function refineSelection(obj)
    Spring.SelectUnitArray(obj.unitIDs)
end

local function addUnitGroup(name,texture,overlay,unitIDs, teamColor)
    local count = #unitIDs
    if count == 1 then count = '' end
    local unitCount = Chili.Label:New{
        caption = count,
        y       = 5,
        right   = 5,
    }
    
    healthBars[#healthBars + 1] = Chili.Progressbar:New{
        name    = "healthbar " .. #healthBars,
        unitIDs = unitIDs,
        value   = 0,
        bottom  = 4,
        x       = 0,
        width   = '100%',
        height  = '10%',
        color   = {0.5,1,0,1},
    }
    local unitIcon = Chili.Image:New{
        file     = texture,
        height   = '100%',
        width    = '100%',
        flip     = false,
        children = {
            Chili.Image:New{
                color    = teamColor, 
                height   = '100%',
                width    = '100%',
                file     = overlay,
                children = {unitCount}
            },
        },
    }
    
    local button = Chili.Button:New{
        unitIDs = unitIDs,
        caption  = '',
        margin   = {1,1,1,1},
        padding  = {0,0,0,0},
        children = {unitIcon, healthBars[#healthBars]},
        onclick = {refineSelection},       
    }
    
    unitGrid:AddChild(button)
end

local function showUnitGrid()
    local selUnits = curTip.selUnits 
    local sortedSelUnits = curTip.sortedSelUnits 
    local teamColor = {r,g,b} 

    -- choose colour by majority vote per unitdef 
    for unitDefID, unitIDs in pairs(sortedSelUnits) do
        local unitTeams = {}
        for _,unitID in ipairs(selUnits) do
            if spGetUnitDefID(unitID) == unitDefID then
                local teamID = spGetUnitTeam(unitID)
                unitTeams[teamID] = (unitTeams[teamID] or 0) + 1
            end
        end
        local mostTeam, mostCount = nil,0
        for teamID,n in pairs(unitTeams) do
            if n>mostCount then
                mostTeam = teamID
                mostCount = n        
            end
        end
        if unitDefID ~= 'n' then 
            local r,g,b = Spring.GetTeamColor(mostTeam)
            local teamColor = {r,g,b}
    
            local name    = UnitDefs[unitDefID].name
            local texture = '#'..unitDefID
            local overlay = imageDir..'Overlays/' .. name .. '.dds'
            addUnitGroup(name, texture, overlay, unitIDs, teamColor)
        end
    end

    local Ecost = 0
    local Mcost = 0
    for a = 1, #healthBars do
        for b = 1, #healthBars[a].unitIDs do
            local unitID = healthBars[a].unitIDs[b]
            local defID = spGetUnitDefID(unitID)
            if defID then
                local Ec = UnitDefs[defID].energyCost or 0
                local Mc = UnitDefs[defID].metalCost or 0
                if not UnitDefs[defID].customParams.iscommander then
                    Mcost = Mcost + Mc
                    Ecost = Ecost + Ec                
                end
            end
        end
    end
        
    unitCostText = Chili.TextBox:New{
        name     = "unitCostText",
        x        = '67%',
        y        = '70%',
        text     = "Cost:\n" .. CostToolTip(Mcost, Ecost),
        font     = {size=fontSize},
    }
        
    unitResText = Chili.TextBox:New{
        name     = "unitResText",
        x        = '5%',
        y        = '70%',
        text     =  "", 
        font     = {size=fontSize},
    }

    unitGridWindow:AddChild(unitCostText)
    unitGridWindow:AddChild(unitResText)
    unitGridWindow:AddChild(unitGrid)

    updateUnitGrid()
    unitGridWindow:Show()
end


function updateUnitGrid()
    -- multiple units, but not so many we cant fit pics
    local Mmake,Muse,Emake,Euse = 0,0,0,0
    for a = 1, #healthBars do
        local health,max = 0,0
        for b = 1, #healthBars[a].unitIDs do
            local unitID = healthBars[a].unitIDs[b]
            local defID = spGetUnitDefID(unitID)
            if defID then
                local h, m = spGetUnitHealth(unitID)
                max   = max + (m or 0)
                health = health + (h or 0)
                local Mm, Mu, Em, Eu = spGetUnitResources(unitID)
                Mmake = Mmake + (Mm or 0)
                Emake = Emake + (Em or 0)
                Muse = Muse + (Mu or 0)
                Euse = Euse + (Eu or 0)
            end
        end
        healthBars[a].max = max
        healthBars[a]:SetValue(health)
    end
    
    local n = spGetGameFrame()
    if n%30==1 or unitResText.text=='' then
        unitResText:SetText("Resources:\n" .. ResToolTip(Mmake, Muse, Emake, Euse))
    end
end

----------------------------------
-- single unitdef info

local function showUnitInfo()
    local defID = curTip.selDefID
    local selUnits = curTip.selUnits 
    local n = #selUnits
    local unitTeamID = selUnits[1] and Spring.GetUnitTeam(selUnits[1]) or Spring.GetMyTeamID() --colour used 
    local multipleTeams = "" 
    
    local description = UnitDefs[defID].tooltip or ''
    local name        = UnitDefs[defID].name
    local texture     = '#'..defID
    local overlay     = imageDir..'Overlays/' .. name .. '.dds'
    local overlayColor = GetOverlayColor(unitTeamID)
    local humanName   = UnitDefs[defID].humanName
    
    local faction = UnitDefs[defID].customParams.faction
    local factionPic, factionPicColour = GetFactionPicInfo(unitTeamID, faction)

    for _, uID in ipairs(selUnits) do
        if (Spring.GetUnitTeam(uID)~=unitTeamID) then 
            multipleTeams = ", multiple teams" 
            break
        end
    end

    local numText = ""
    if n>1 then numText = "\n " .. blue .. "(x" .. tostring(n) .. multipleTeams .. ")" end
    if description ~= "" then description = "\n" .. description end

    unitPicture = Chili.Image:New{
        parent   = unitWindow,
        file     = texture,
        color    = {0.5,0.5,0.5,1.0},--overlayColor,
        flip     = false,
        height   = '100%',
        width    = '100%',
    }
    unitPictureOverlay = Chili.Image:New{
        parent   = unitPicture,
        color    = overlayColor, 
        height   = '100%',
        width    = '100%',
        file     = overlay,
    }
    
    unitName = Chili.TextBox:New{
        parent = unitPictureOverlay,
        x      = '5%',
        y      = '5%',
        width  = '80%',
        text   = humanName .. description .. numText,
        font   = {size=fontSize},
    }

    if factionPic then
        unitFactionPic = Chili.Image:New{
            parent = unitPictureOverlay,
            name   = 'unitFaction',
            height = '10%',
            width  = '10%',
            y      = '5%',
            right  = '5%',
            file   = factionPic,
            color  = factionPicColour,
        }
    end
    
    unitHealthText = Chili.TextBox:New{
        parent = unitPictureOverlay,
        x      = '5%',
        bottom = '13%',
        text   = '',
        font   = {size=fontSize},
    }
    
    unitHealth = Chili.Progressbar:New{
        name   = "unitHealth",
        parent = unitPictureOverlay,
        value   = 0,
        bottom  = '5%',
        x       = '5%',
        width   = '90%',
        height  = '5%',
        color   = {0.5,1,0,1},
    }
    
    unitResText = Chili.TextBox:New{
        parent = unitPictureOverlay,
        x        = '5%',
        y        = '62%',
        text     =  '',
        autoHeight = false,
        font     = {size=fontSize},
    }
    
    updateUnitInfo()
    unitWindow:Show()        
end

function updateUnitInfo()
    -- single unit type
    local curHealth = 0
    local maxHealth = 0
    local Mmake, Muse, Emake, Euse = 0,0,0,0
    for _, uID in ipairs(curTip.selUnits) do
        c, m = spGetUnitHealth(uID)
        mm, mu, em, eu = spGetUnitResources(uID)
        curHealth = curHealth + (c or 0)
        maxHealth = maxHealth + (m or 0)
        Mmake = Mmake + (mm or 0)
        Muse = Muse + (mu or 0)
        Emake = Emake + (em or 0)
        Euse = Euse + (eu or 0)
    end
    if maxHealth>0 then 
        unitHealthText:SetText(math.floor(curHealth) ..' / '.. math.floor(maxHealth)) 
        unitHealth:SetMinMax(0, maxHealth)
        unitHealth:SetValue(curHealth) 
    else -- if we can't see the units health (e.g. enemy commander)
        unitHealthText:SetText('? / ?') 
        unitHealth:SetMinMax(0, 1)
        unitHealth:SetValue(0) 
    end
    
    local n = spGetGameFrame()
    if (n%30==1 or unitResText.text=='') and not curTip.selEnemy then --don't do this unless we have too; concats are not free
        unitResText:SetText(ResToolTip(Mmake, Muse, Emake, Euse))
    end
end

----------------------------------
-- basic unit info

local function showBasicUnitInfo()

    basicUnitText = Chili.TextBox:New{
        parent = unitGridWindow,
        x      = '5%',
        y      = '5%',
        right  = '10%',
        text   = "Units selected: " .. curTip.n .. "\nUnit types: " .. curTip.nType,
        font   = {size=fontSize},
    }
    
    local mCost = 0
    local eCost = 0
    for uDID,t in pairs(curTip.sortedSelUnits) do
        if uDID~="n" and UnitDefs[uDID].customParams.iscommander~="1" then
            mCost = mCost + (#t)*UnitDefs[uDID].metalCost
            eCost = eCost + (#t)*UnitDefs[uDID].energyCost
        end    
    end

    basicCostText = Chili.TextBox:New{
        parent = unitGridWindow,
        x      = '5%',
        y      = '23%',
        right  = 0,
        bottom = 0,
        text   = "Cost:\n" .. CostToolTip(mCost, eCost),       
        font   = {size=fontSize},
    }

    basicResText = Chili.TextBox:New{
        parent = unitGridWindow,
        x      = '5%',
        y      = '52%',
        right  = '5%',
        bottom = '5%',
        text   = '',       
        font   = {size=fontSize},
    }
    
    basicHealthText = Chili.TextBox:New{
        parent = unitGridWindow,
        x      = '5%',
        bottom = '13%',
        text   = 'Health:',
        font   = {size=fontSize},
    }
    
    basicHealth = Chili.Progressbar:New{
        name   = "basicHealth",
        parent = unitGridWindow,
        value   = 0,
        bottom  = '5%',
        x       = '5%',
        width   = '95%',
        height  = '5%',
        color   = {0.5,1,0,1},
    }    
    
    updateBasicUnitInfo()
    unitGridWindow:Show()
end

function updateBasicUnitInfo()
    -- many different units types
    local curHealth = 0
    local maxHealth = 0
    local Mmake, Muse, Emake, Euse = 0,0,0,0
    for _, uID in ipairs(curTip.selUnits) do
        c, m = spGetUnitHealth(uID)
        mm, mu, em, eu = spGetUnitResources(uID)
        curHealth = curHealth + (c or 0)
        maxHealth = maxHealth + (m or 0)
        Mmake = Mmake + (mm or 0)
        Muse = Muse + (mu or 0)
        Emake = Emake + (em or 0)
        Euse = Euse + (eu or 0)
    end
    if maxHealth>0 then 
        basicHealth:SetMinMax(0, maxHealth)
        basicHealth:SetValue(curHealth) 
    else -- if we can't see the units health (e.g. enemy commander)
        basicHealth:SetMinMax(0, 1)
        basicHealth:SetValue(0) 
    end
    
    local n = spGetGameFrame()
    if (n%30==1 or basicResText.text=='') and not curTip.selEnemy then --don't do this unless we have too; concats are not free
        basicResText:SetText('Resources:\n' .. ResToolTip(Mmake, Muse, Emake, Euse))
    end
end

----------------------------------
-- focus unit info

local function GetMaxWeaponRange (ud)
    -- get the max range of this units weapons
    local range = -1
    for _,v in pairs(ud.weapons) do
        local wDID = v.weaponDef
        local wd = WeaponDefs[wDID]
        range = math.max(range,wd.range)    
    end
    return range
end
local function GetMaxWeaponReload (ud)
    -- get the max weapon reload time of this units weapons
    local reload = -1
    for _,v in pairs(ud.weapons) do
        local wDID = v.weaponDef
        local wd = WeaponDefs[wDID]
        reload = math.max(reload,wd.reload)    
    end
    return reload
end
local function GetMaxDamage (wd)
    -- get the max damage dealt by a single shot of this weapon
    local dmg = -1
    for _,v in pairs(wd.damages) do
        dmg = math.max(dmg,v)
    end
    return dmg
end
local function GetDamagePerSec (ud)
    -- classify the DPS of the weapons of this unit
    local damage = 0
    local n = 0
    for _,v in pairs(ud.weapons) do
        n = n + 1
        local wDID = v.weaponDef
        local wd = WeaponDefs[wDID]
        local oDmg = GetMaxDamage(wd)
        local oBurst = wd.salvoSize*wd.projectiles
        local oRld = math.max(1/30,wd.stockpile and wd.stockpileTime or wd.reload)
        damage = damage + oBurst*oDmg/oRld
    end

    return damage
end
local function GetDamagePerShot (ud)
    -- classify the damage of a single missile fired by this units first weapon
    local wDID = ud.weapons[1].weaponDef
    local wd = WeaponDefs[wDID]
    local oBurst = wd.salvoSize*wd.projectiles
    local damage = GetMaxDamage(wd) * oBurst
    return damage
end
local function GetWindString()
    local lower = round(Game.windMin)
    local upper = round(Game.windMax)
    if tonumber(lower)<tonumber(upper) then
        return lower .. " to " .. upper
    end
    return lower
end

local function isKamikaze(ud)
    if #ud.weapons~=2 then return false end
    local wd = WeaponDefs[ud.weapons[1].weaponDef]
    if string.find(wd.name,"mine_dummy") then return true end
    if string.find(wd.name,"crawl_dummy") then return true end
    return false
end
    
local function GetUnitDefKeyProperties (defID)
    local ud = UnitDefs[defID]
    local t = {}
    
    -- deal with mines and crawling bombs
    if isKamikaze(ud) then
        if ud.speed>0 then t[#t+1] = {"Max Speed", tomato .. round(ud.speed)} end
        local bomb_wd = WeaponDefs[ud.weapons[2].weaponDef]
        t[#t+1] = {"Damage", red .. round(GetMaxDamage(bomb_wd))} 
        return t
    end
    
    -- deal with two very special cases
    if defID==UnitDefNames.commando.id then
        t[#t+1] = {"Health", green .. tostring(ud.health)}
        t[#t+1] = {"Max Speed", tomato .. round(ud.speed)}
        t[#t+1] = {"Build Power", lilac .. round(ud.buildSpeed)}
        t[#t+1] = {"Weapon Range", turqoise .. round(GetMaxWeaponRange(ud))}
        t[#t+1] = {"Damage Per Sec", red .. round(GetDamagePerSec(ud))}    
        return t
    elseif ud.customParams.iscommander=="1" then
        t[#t+1] = {"Health", green .. tostring(ud.health)}
        t[#t+1] = {"Max Speed", tomato .. round(ud.speed)}
        t[#t+1] = {"Build Power", lilac .. round(ud.buildSpeed)}
        t[#t+1] = {"Weapon Range", turqoise .. round(GetMaxWeaponRange(ud))}
        return t
    end
    
    -- deal with the rest
    t[#t+1] = {"Health", green .. tostring(ud.health)}
    if ud.speed>0 then t[#t+1] = {"Max Speed", tomato .. round(ud.speed)} end
    
    if ud.isFactory or ud.isBuilder then
        t[#t+1] = {"Build Power", lilac .. round(ud.buildSpeed)}
    elseif ud.energyMake>=20 and #ud.weapons==0 and ud.speed==0 then
        t[#t+1] = {"Energy Output", eColour .. round(ud.energyMake)}
    elseif (ud.radarRadius>200 or ud.sonarRadius>200) and #ud.weapons==0 then
        if ud.radarRadius>200 then t[#t+1] = {"Radar Range", turqoise .. round(ud.radarRadius)} end
        if ud.sonarRadius>200 then t[#t+1] = {"Sonar Range", turqoise .. round(ud.sonarRadius)} end
        if ud.losRadius>0 then t[#t+1] = {"LOS Range", turqoise .. round(ud.losRadius)} end
    elseif ud.jammerRadius>0 and #ud.weapons==0 then
        t[#t+1] = {"Jammer Radius", turqoise .. round(ud.jammerRadius)}
        -- note: there are no sonar jammers
    elseif ud.seismicRadius>0 then
        t[#t+1] = {"Coverage Radius", turqoise .. round(ud.seismicRadius)}
    elseif ud.energyStorage>=3000 then
        t[#t+1] = {"Energy Storage", eColour .. round(ud.energyStorage)} 
    elseif ud.metalStorage>=1000 then
        t[#t+1] = {"Metal Storage", mColour .. round(ud.metalStorage)}
    elseif ud.windGenerator>0 then
        t[#t+1] = {"Energy Output", eColour .. GetWindString()}
    elseif ud.tidalGenerator>0 then
        t[#t+1] = {"Energy Output", eColour .. round(Game.tidal)}
    --elseif ud.isExtractor then
        -- do nothing, extraction shows in the tooltip as a result of prospector
        -- if it has a weapon, it'll get picked up later
    elseif #ud.weapons>0 and WeaponDefs[ud.weapons[1].weaponDef].interceptor~=0 then
        -- anti-nukes
        local wd = WeaponDefs[ud.weapons[1].weaponDef]
        t[#t+1] = {"Coverage Radius", turqoise .. round(wd.coverageRange)}
        t[#t+1] = {"Stockpile Time", blue .. round(wd.stockpileTime/30) .. "s"}
        if ud.energyMake>=20 then t[#t+1] = {"Energy Output", eColour .. round(ud.energyMake)} end -- mobile antis make 200e
    elseif #ud.weapons>0 and WeaponDefs[ud.weapons[1].weaponDef].type=="Shield" then
        local wd = WeaponDefs[ud.weapons[1].weaponDef]
        t[#t+1] = {"Coverage Radius", turqoise .. round(wd.shieldRadius)}  
    elseif (#ud.weapons>0) and (not ud.canMove) and (WeaponDefs[ud.weapons[1].weaponDef].type=="StarburstLauncher" or WeaponDefs[ud.weapons[1].weaponDef].stockpileTime/30>7) then
        -- static launchers
        local wd = WeaponDefs[ud.weapons[1].weaponDef]
        t[#t+1] = {"Weapon Range", turqoise .. round(GetMaxWeaponRange(ud))}
        t[#t+1] = {"AOE", turqoise .. round(wd.damageAreaOfEffect)}
        t[#t+1] = {"Stockpile Time", blue .. round(wd.stockpileTime/30) .. "s"}
        t[#t+1] = {"Damage Per Shot", red .. round(GetDamagePerShot(ud))}
        -- missile costs would be nice but no space
    elseif #ud.weapons>0 then
        -- mobile units & static def
        if not ud.isBomberAirUnit then t[#t+1] = {"Weapon Range", turqoise .. round(GetMaxWeaponRange(ud))} end
        if GetMaxWeaponReload(ud)>=7 then 
            t[#t+1] = {"Reload Time", blue .. round(GetMaxWeaponReload(ud)) .. "s"}
            if WeaponDefs[ud.weapons[1].weaponDef].paralyzer then
                t[#t+1] = {"Paralyze Time", blue .. round(WeaponDefs[ud.weapons[1].weaponDef].damages.paralyzeDamageTime).. "s"}            
            else            
                t[#t+1] = {"Weapon Damage", red .. round(GetDamagePerShot(ud))}
            end
        else 
            if WeaponDefs[ud.weapons[1].weaponDef].paralyzer then
                t[#t+1] = {"Paralyze Time", blue .. round(WeaponDefs[ud.weapons[1].weaponDef].damages.paralyzeDamageTime) .. "s"}            
            else            
                t[#t+1] = {"Damage Per Sec", red .. round(GetDamagePerSec(ud))}     
            end
        end
    end

    return t
end

local function showFocusInfo()
    -- uses unitWindow
    local defID = curTip.focusDefID
    local unitDef = UnitDefs[defID]
    local unitTeamID = curTip.selUnits[1] and Spring.GetUnitTeam(curTip.selUnits[1]) or Spring.GetMyTeamID()

    local description = UnitDefs[defID].tooltip or ''
    local name        = UnitDefs[defID].name
    local texture     = '#'..defID
    local overlay     = imageDir..'Overlays/' .. name .. '.dds'
    local overlayColor = GetOverlayColor(unitTeamID)
    local humanName   = UnitDefs[defID].humanName

    local faction = UnitDefs[defID].customParams.faction
    local factionPic, factionPicColour = GetFactionPicInfo(unitTeamID, faction)

    local Ecost = UnitDefs[defID].energyCost
    local Mcost = UnitDefs[defID].metalCost 
    local maxHealth = UnitDefs[defID].health

    -- picture
    focusPicture = Chili.Image:New{
        parent   = unitWindow,
        file     = texture,
        color    = {0.5,0.5,0.5,1.0},
        flip     = false,
        height   = '100%',
        width    = '100%',
    }
    focusPictureOverlay = Chili.Image:New{
        parent = focusPicture,
        color    = overlayColor,
        height   = '100%',
        width    = '100%',
        file     = overlay,
    }
        
    -- name
    focusName = Chili.TextBox:New{
        parent = focusPictureOverlay,
        x      = '5%',
        y      = '5%',
        width  = '80%',
        text   = humanName .. "\n" .. description,
        font   = {size=fontSize},
    }
    
    if factionPic then
        focusFactionPic = Chili.Image:New{
            parent = focusPictureOverlay,
            name   = 'focusFaction',
            height = '10%',
            width  = '10%',
            y      = '5%',
            right  = '5%',
            file   = factionPic,
            color  = factionPicColour,
        }
    end

    -- costs + buildtime
    if unitDef.customParams.iscommander~="1" then  
        focusCostText = Chili.TextBox:New{
            parent = focusPictureOverlay,
            x        = '5%',
            bottom   = '14%',
            text     =  "Cost: " .. mColour .. unitDef.metalCost .. " " .. eColour .. unitDef.energyCost,
            font   = {size=fontSize},
        }
        focusBuildTimeText = Chili.TextBox:New{
            parent = focusPictureOverlay,
            x        = '5%',
            bottom   = '5%',
            text     =  "Build Time: " .. lilac .. unitDef.buildTime, -- this isn't very intuitive
            font   = {size=fontSize},
        }
    end
    
    -- key properties
    local keyProperties = GetUnitDefKeyProperties(defID)
    local keyPropertiesText = ""
    local n = 0
    for _,v in pairs(keyProperties) do
        local text = tostring(v[1]) .. ": " .. tostring(v[2])
        keyPropertiesText = keyPropertiesText .. text .. "\n" .. white
        n = n + 1
    end
    local keyY = tostring(100-n*8-23) .. '%'
    
    focusKeyText = Chili.TextBox:New{
        parent = focusPictureOverlay,
        x        = '5%',
        y        = keyY,
        width    = '90%',
        text     = keyPropertiesText,
        font   = {size=fontSize},
    }
        
    unitWindow:Show()        
end


----------------------------------
-- single feature info

function showFeatureInfo()
    -- uses unitWindow
    local fID = curTip.featureID
    local defID = curTip.featureDefID
    local fTeamID = Spring.GetFeatureTeam(fID)
    local faction = FeatureDefs[defID].customParams.faction
    local factionPic, factionPicColour = GetFactionPicInfo(fTeamID, faction)
        
    local description = FeatureDefs[defID].tooltip or ''
    -- there is no buildpic for features
    featureName = Chili.TextBox:New{
        parent = unitWindow,
        x      = '5%',
        y      = '5%',
        width  = '80%',
        text   = description,
        font   = {size=fontSize},
    }
    
    if factionPic then
        featureFactionPic = Chili.Image:New{
            parent = unitWindow,
            name   = 'featureFaction',
            height = '10%',
            width  = '10%',
            y      = '5%',
            right  = '5%',
            file   = factionPic,
            color  = factionPicColour,
        }
    end

    featureHealthText = Chili.TextBox:New{
        parent = unitWindow,
        x      = '5%',
        bottom = '13%',
        text   = '',
        font   = {size=fontSize},
    }
    
    featureHealth = Chili.Progressbar:New{
        name   = "featureHealth",
        parent = unitWindow,
        value   = 0,
        bottom  = '5%',
        x       = '5%',
        width   = '95%',
        height  = '5%',
        color   = {0.5,1,0,1},
    }
    
    featureResText = Chili.TextBox:New{
        parent = unitWindow,
        x      = '5%',
        y      = '35%',
        text   =  '',
        font   = {size=fontSize},
    }    
    
    unitWindow:Show()    
end

function FeatureToolTip(rMetal, mMetal, rEnergy, mEnergy, reclaimLeft, rezProg, rezDefName)
    local tip =  "Metal: " .. mColour .. round(rMetal) .. "  / " .. round(mMetal) .. "" .. "\n" ..
                white .. "Energy: " .. eColour .. round(rEnergy) .. "  / " .. round(mEnergy) .. "" .. "\n" .. white ..
                "Reclaim left: " .. green .. round(100*reclaimLeft) .. "%" .. "\n" .. white
    if rezDefName ~= "" then             
        tip = tip .. "Resurrected: " .. lilac .. round(100*rezProg) .. "%"
    end
    return tip
end

function updateFeatureInfo()
    local fID = curTip.featureID
    if not spValidFeatureID(fID) then return end
    
    local rMetal, mMetal, rEnergy, mEnergy, reclaimLeft = spGetFeatureResources(fID) -- remaining, max
    local fDID = spGetFeatureDefID(fID)
    local curHealth, maxHealth, rezProg = spGetFeatureHealth(fID)
    local fTeamID = spGetFeatureTeam(fID)
    local rezDefName,_ = spGetFeatureResurrect(fID)
    if maxHealth>0 then 
        featureHealthText:SetText(math.floor(curHealth) ..' / '.. math.floor(maxHealth)) 
        featureHealth:SetMinMax(0, maxHealth)
        featureHealth:SetValue(curHealth) 
    else -- if we can't see the units health (e.g. enemy commander)
        featureHealthText:SetText('? / ?') 
        featureHealth:SetMinMax(0, 1)
        featureHealth:SetValue(0) 
    end

    local n = spGetGameFrame()
    if n%4==0 or featureResText.text=='' then
        featureResText:SetText(FeatureToolTip(rMetal, mMetal, rEnergy, mEnergy, reclaimLeft, rezProg, rezDefName))
    end
end
    
----------------------------------
-- ground info

local modColScale = 2
local function speedModCol(x)
    x = (x-1)*modColScale + 1
    local r,g,b = 1,1,1
    if x<1 then
        g = max(0.01,x)
        b = max(0.01,x)
    elseif x>1 then
        x = min(x, 1.99)
        r = min(0.99,2-x)
        b = min(0.99,2-x)
    end
    return schar(255, r*255, g*255, b*255)
end

local endModes = { com = "Kill all enemy coms", killall = "Kill all enemy units", neverend = "Never end"}
local gameEndMode = endModes[Spring.GetModOptions().deathmode] or ""        
local generalInfo = "" ..
    "Map: " .. green .. Game.mapName .. "\n" .. white ..
    "Map Size: " .. green .. Game.mapX .. " x " .. Game.mapY .. "\n" .. white ..
    "Wind: " .. yellow .. math.floor(Game.windMin) .. " - " .. math.floor(Game.windMax) .. "\n" .. white ..
    "Tidal: " .. blue .. math.floor(Game.tidal) .. "\n" .. white ..
    "Acidity: " .. turqoise .. math.floor(Game.waterDamage) .. "\n" .. white ..
    "Gravity: " .. tomato .. math.floor(Game.gravity) .. "\n\n" .. white ..
    "Game End:\n" .. 
    " " .. green .. gameEndMode  
local armageddonTime = tonumber((Spring.GetModOptions() or {}).mo_armageddontime) or 0
if armageddonTime and tonumber(armageddonTime)>0 then
    generalInfo = generalInfo .. "\n " .. red .. "Armageddon at " .. armageddonTime .. ":00"
end
local preventCombombs = (tonumber(Spring.GetModOptions().mo_preventcombomb) or 0) ~= 0
if preventCombombs then
    generalInfo = generalInfo .. "\n" .. red .. " No combombs"
end

local function updateGroundInfo()
    if groundWindow.hidden then groundWindow:Show() end

    local mx, my    = spGetMouseState()
    local focus,map = spTraceScreenRay(mx,my,true)
    if focus~="ground" then         
        groundText:SetText(generalInfo)
        return
    end 
    
    x,y,z = map[1],map[2],map[3]    
    local px,pz = math.floor(x),math.floor(z)
    local py = math.floor(spGetGroundHeight(px,pz))

    local _,_,_,veh,bot,hvr,ship,_ = spGetGroundInfo(px,pz)  --104fix
    vehCol = speedModCol(veh)
    botCol = speedModCol(bot)
    hvrCol = speedModCol(hvr)
    shipCol = speedModCol(ship)
    local acidityText = ""
    if (py<0) then acidityText = "Acidity: " .. Game.waterDamage end
    
    groundText:SetText(
        "Map Coordinates"..
        "\n Height: " .. lilac .. py ..
        white .. "\n X: ".. blue .. px ..
        white .. "\n Z: ".. blue .. pz .. "\n\n" .. white ..
        "Speeds" ..
        "\n  Veh: " .. vehCol .. round(veh,2) .. white .. 
        "  Bot: " .. botCol .. round(bot,2) .. white ..
        "\n  Hvr: " .. hvrCol .. round(hvr,2) .. white ..
        "  Ship: " .. shipCol .. round(ship,2) .. white  ..
        "\n" .. acidityText        
    )


end


----------------------------------
-- (re-)setting up 

local function ChooseCurTip()
    curTip = {}

    -- determine if we have any selected units
    local selUnits = spGetSelectedUnits()
    local sortedSelUnits = spGetSelectedUnitsSorted()
    if selUnits == nil or sortedSelUnits == nil then -- seems to happen rarely due to engine weirdness
         curTip.type = "ground"
         return
    end
    
    curTip.selUnits = selUnits
    curTip.sortedSelUnits = sortedSelUnits
    curTip.n = #selUnits
    curTip.nType = sortedSelUnits['n']
    
    -- choose tip type
    if focusDefID then
        -- focus info about a unit we are thinking to build
        curTip.type = "focusDefID"
        curTip.focusDefID = focusDefID
        if not UnitDefs[curTip.focusDefID] then --DEBUG
            Spring.Echo("ERROR: invalid focusDefID") 
            Spring.Echo(focusDefID)
        end --
    elseif sortedSelUnits["n"] == 1 and preferFocus then
        -- focus info about units of a single unitDefID 
        curTip.type = "focusDefID"
        curTip.focusDefID = Spring.GetUnitDefID(selUnits[1])  
        if not UnitDefs[curTip.focusDefID] then --DEBUG
            Spring.Echo("ERROR: invalid Spring.GetUnitDefID(selUnits[1])") 
            Spring.Echo(Spring.GetUnitDefID(selUnits[1]))
        end --
    elseif sortedSelUnits["n"] == 1 then
        -- info about selected units of a single unitDefID 
        curTip.type = "unitDefID"
        curTip.selDefID = Spring.GetUnitDefID(selUnits[1])  
    elseif sortedSelUnits["n"] <= 6 and sortedSelUnits["n"] > 1 then 
        -- info about selected units of multiple unitDefIDs, but few enough that we can display a small pic for each
        curTip.type = "unitDefPics"
    elseif sortedSelUnits["n"] > 6 then
        -- info about so many selected units that we just give basic info
        curTip.type = "basicCostText"
    elseif mouseOverUnitID and preferFocus then
        -- focus info about a single mouse over unit
        curTip.type = "focusDefID"
        curTip.focusDefID = mouseOverUnitDefID     
        if not UnitDefs[curTip.focusDefID] then --DEBUG
            Spring.Echo("ERROR: invalid mouseOverUnitDefID") 
            Spring.Echo(mouseOverUnitDefID)
        end --
        curTip.selUnits = {[1]=mouseOverUnitID}
    elseif mouseOverUnitID and mouseOverUnitDefID then
        -- info about a single mouse over unit
        curTip.type = "unitDefID"
        curTip.selDefID = mouseOverUnitDefID
        curTip.selUnits = {[1]=mouseOverUnitID}
    elseif mouseOverFeatureID and mouseOverFeatureDefID then
        -- info about a single mouse over feature
        curTip.type = "feature"
        curTip.featureID = mouseOverFeatureID
        curTip.featureDefID = mouseOverFeatureDefID    
    else
        --info about point on map corresponding to cursor 
        curTip.type = "ground"
    end
    
    -- mark that we won't show resource stats if the selection contains a non-allied unit
    if #curTip.selUnits==0 then return end
    local selEnemyUnit = false
    local spec,_ = Spring.GetSpectatingState()
    if not spec then
        for _,uID in ipairs(curTip.selUnits) do
            local tID = Spring.GetUnitTeam(uID)
            if ((tID == nil ) or (not Spring.AreTeamsAllied(tID, myTeamID))) then
                selEnemyUnit = true
                break
            end
        end
    end
    curTip.selEnemy = selEnemyUnit    
end

local function ResetTip()
    -- delete/hide the old tip
    curTip = nil
    healthBars = {}
    if unitWindow.visible then unitWindow:Hide() end
    if groundWindow.visible then groundWindow:Hide() end
    if unitGridWindow.visible then unitGridWindow:Hide() end
    unitWindow:ClearChildren()
    unitGridWindow:ClearChildren()
    unitGrid:ClearChildren()
    
    -- choose the new tip
    ChooseCurTip()

    if curTip.type=="focusDefID" then
        showFocusInfo()
    elseif curTip.type=="unitDefID" then
        showUnitInfo()
    elseif curTip.type=="unitDefPics" then
        showUnitGrid()
    elseif curTip.type=="basicCostText" then
        showBasicUnitInfo() 
    elseif curTip.type=="feature" then
        showFeatureInfo()
    elseif curTip.type=="ground" then
        updateGroundInfo()
    end
end

local function TogglePreferredUnitInfo()
    if unitWindow.visible then
        preferFocus = not preferFocus
        ResetTip()
    end
end

----------------------------------

function widget:Initialize()    
    if (not WG.Chili) then
        widgetHandler:RemoveWidget()
        return
    end
    
    Chili = WG.Chili
    buttonColour = WG.buttonColour
    fontSize = WG.RelativeFontSize(relFontSize)

    screen = Chili.Screen0
    
    unitWindow = Chili.bguButton:New{ -- parent for all the single unit info stuffs (including focus)
        parent  = screen,
        tooltip = "Click to show/hide detailed unit stats",
        padding = {6,6,6,6},
        borderColor = buttonColour,
        backgroundColor = buttonColour,
        caption = "",
        OnClick = {TogglePreferredUnitInfo},
    }
    
    unitGridWindow = Chili.bguButton:New{ -- parent for unit grid display, children are regenerated on each change
        parent  = screen,
        padding = {6,6,6,6},
        borderColor = buttonColour,
        backgroundColor = buttonColour,
        focusColor = buttonColour,
        caption = "",
        OnClick = {}, -- this has to exist as a separate case to unitWindow, because it can't act when clicked (or its child buttons won't work)
    }
    
    unitGrid = Chili.Grid:New{ 
        x       = 0,
        y       = 0,
        height  = '100%',
        width   = '100%',
        rows    = 3,
        columns = 3,
        padding = {0,0,0,0},
        margin  = {0,0,0,0},
    }    
    
    groundWindow = Chili.bguButton:New{ -- parent for ground info, children are permanent
        name    = "ground window",
        parent  = screen,
        padding = {6,6,6,6},
        borderColor = buttonColour,
        backgroundColor = buttonColour,
        focusColor = buttonColour,
        caption = "",
    }    
    groundText = Chili.TextBox:New{
        parent = groundWindow,
        x = '5%',
        y = '5%',
        width = '90%',
        text   = '',
        
    }
    
    Spring.SetDrawSelectionInfo(false)
    resizeUI()
    
    widget:CommandsChanged()
end

function widget:ViewResize()
    resizeUI()
end

----------------------------------

function widget:PlayerChanged()
    myTeamID  = Spring.GetMyTeamID()
end    

function widget:CommandsChanged()
    ResetTip()
end

function widget:Update()
    -- check if focus unitDefID provided by widget has changed
    local _,cmdID,_ = spGetActiveCommand()
    local newFocusDefID
    if WG.InitialQueue and WG.InitialQueue.selDefID then
        newFocusDefID = WG.InitialQueue.selDefID
    elseif WG.sMenu and WG.sMenu.mouseOverUnitDefID then
        newFocusDefID = WG.sMenu.mouseOverUnitDefID 
    elseif WG.FacBar and WG.FacBar.mouseOverUnitDefID then
        newFocusDefID = WG.FacBar.mouseOverUnitDefID 
    elseif cmdID and cmdID<0 then
        newFocusDefID = -cmdID  
    else
        newFocusDefID = nil
    end    
    if newFocusDefID~= focusDefID then
        focusDefID = newFocusDefID
        widget:CommandsChanged()
        return
    end

    -- check if the mouse moves on/off a unit/feature, call CommandsChanged if so
    -- also, update ground info if needed
    local mx,my = spGetMouseState()
    local focus,n = spTraceScreenRay(mx,my)
    local timer = spGetTimer()
    local updateGround = (curTip.type=="ground") and spDiffTimers(timer, groundTimer) > 0.05 
    local newMouseOverUnitID, newMouseOverFeatureID
    local focusChange = false
    if focus=="unit" then
        newMouseOverUnitID = n
    elseif focus=="feature" then
        newMouseOverFeatureID = n
    elseif updateGround then
        updateGroundInfo()
        groundTimer = timer
        newMouseOverUnitID  = nil
        newMouseOverFeatureID = nil
    else
        newMouseOverUnitID  = nil
        newMouseOverFeatureID = nil
    end
    if newMouseOverUnitID ~= mouseOverUnitID then
        mouseOverUnitID = newMouseOverUnitID 
        mouseOverUnitDefID = mouseOverUnitID and spGetUnitDefID(mouseOverUnitID) or nil
        if not mouseOverUnitDefID then mouseOverUnitID=nil end -- if the unitID is not a valid unit, Spring won't give the defID
        focusChange = true
    end
    if newMouseOverFeatureID ~= mouseOverFeatureID then
        mouseOverFeatureID = newMouseOverFeatureID
        mouseOverFeatureDefID = mouseOverFeatureID and spGetFeatureDefID(mouseOverFeatureID) or nil
        if not mouseOverFeatureDefID then mouseOverFeatureID=nil end
        focusChange = true
    end
    if focusChange then
        widget:CommandsChanged()
    end
end

function widget:GameFrame(n)
    if curTip.type=="unitDefID" then
        updateUnitInfo()    
    elseif curTip.type=="unitDefPics" then
        updateUnitGrid()
    elseif curTip.type=="basicCostText" and n%15==0 then
        -- delayed update, we might have many units to process
        updateBasicUnitInfo()
    elseif curTip.type=="feature" then
        updateFeatureInfo()
    end
end

function widget:MousePress(mx,my,button)
    if button==3 then
        local focus,n = spTraceScreenRay(mx,my)
        local _,cmdID,_ = spGetActiveCommand()
        if focus=="unit" and curTip.selUnits[1]==n and not cmdID then
            TogglePreferredUnitInfo()
            return true
        end
    end
    return nil
end

function widget:Shutdown()
    unitWindow:Dispose()
    groundWindow:Dispose()
    Spring.SetDrawSelectionInfo(true)
end

