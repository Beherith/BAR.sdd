function widget:GetInfo()
    return {
        name = "Prospector",
        desc = "Tooltip for amount of metal available when placing metal extractors",
        author = "Evil4Zerggin, Bluestone, Niobium",
        date = "9 January 2009",
        license = "GNU LGPL, v2.1 or later",
        layer = 1,
        enabled = true
    }
end

------------------------------------------------
--speedups
------------------------------------------------
local GetActiveCommand = Spring.GetActiveCommand
local GetMouseState = Spring.GetMouseState
local TraceScreenRay = Spring.TraceScreenRay
local GetGroundInfo = Spring.GetGroundInfo
local GetGameFrame = Spring.GetGameFrame
local GetMapDrawMode = Spring.GetMapDrawMode

local floor = math.floor
local min, max = math.min, math.max
local sqrt = math.sqrt
local strFind = string.find
local strFormat = string.format

------------------------------------------------
--vars
------------------------------------------------

--unitDefID = {extractsMetal, extractSquare, oddX, oddZ}
local mexDefInfos = {}
local defaultDefID

local centerX, centerZ
local extraction = 0
local lastUnitDefID

local TEXT_CORRECT_Y = 1.25

local myTeamID
local METAL_MAP_SQUARE_SIZE = 16
local MEX_RADIUS = Game.extractorRadius
local MAP_SIZE_X = Game.mapSizeX
local MAP_SIZE_X_SCALED = MAP_SIZE_X / METAL_MAP_SQUARE_SIZE
local MAP_SIZE_Z = Game.mapSizeZ
local MAP_SIZE_Z_SCALED = MAP_SIZE_Z / METAL_MAP_SQUARE_SIZE

local mColour = '\255\153\153\204'

------------------------------------------------
--helpers
------------------------------------------------

local function SetupMexDefInfos() 
    local minExtractsMetal
    
    local armMexDef = UnitDefNames["armmex"]
    
    if armMexDef and armMexDef.extractsMetal > 0 then
        defaultDefID = UnitDefNames["armmex"].id
        minExtractsMetal = 0
    end
    
    for unitDefID = 1,#UnitDefs do
        local unitDef = UnitDefs[unitDefID]
        local extractsMetal = unitDef.extractsMetal
        if (extractsMetal > 0) then
            mexDefInfos[unitDefID] = {}
            mexDefInfos[unitDefID][1] = extractsMetal
            --mexDefInfos[unitDefID][2] = unitDef.extractSquare --removed because deprecated from unitdefs; so mexDefInfos[UnitDefID][x] is defined only for only x=1,3,4.
            if (unitDef.xsize % 4 == 2) then
                mexDefInfos[unitDefID][3] = true
            end
            if (unitDef.zsize % 4 == 2) then
                mexDefInfos[unitDefID][4] = true
            end
            if not minExtractsMetal or extractsMetal < minExtractsMetal then
                defaultDefID = unitDefID
                minExtractsMetal = extractsMetal
            end
        end
    end
    
end

local function IntegrateMetal(mexDefInfo, x, z, forceUpdate)
    local newCenterX, newCenterZ
    
    if (mexDefInfo[3]) then
        newCenterX = (floor( x / METAL_MAP_SQUARE_SIZE) + 0.5) * METAL_MAP_SQUARE_SIZE
    else
        newCenterX = floor( x / METAL_MAP_SQUARE_SIZE + 0.5) * METAL_MAP_SQUARE_SIZE
    end
    
    if (mexDefInfo[4]) then
        newCenterZ = (floor( z / METAL_MAP_SQUARE_SIZE) + 0.5) * METAL_MAP_SQUARE_SIZE
    else
        newCenterZ = floor( z / METAL_MAP_SQUARE_SIZE + 0.5) * METAL_MAP_SQUARE_SIZE
    end
    
    if (centerX == newCenterX and centerZ == newCenterZ and not forceUpdate) then return end
    
    centerX = newCenterX
    centerZ = newCenterZ
    
    local startX = floor((centerX - MEX_RADIUS) / METAL_MAP_SQUARE_SIZE)
    local startZ = floor((centerZ - MEX_RADIUS) / METAL_MAP_SQUARE_SIZE)
    local endX = floor((centerX + MEX_RADIUS) / METAL_MAP_SQUARE_SIZE)
    local endZ = floor((centerZ + MEX_RADIUS) / METAL_MAP_SQUARE_SIZE)
    startX, startZ = max(startX, 0), max(startZ, 0)
    endX, endZ = min(endX, MAP_SIZE_X_SCALED - 1), min(endZ, MAP_SIZE_Z_SCALED - 1)
    
    local mult = mexDefInfo[1]
    local result = 0    

    for i = startX, endX do
        for j = startZ, endZ do
            local cx, cz = (i + 0.5) * METAL_MAP_SQUARE_SIZE, (j + 0.5) * METAL_MAP_SQUARE_SIZE
            local dx, dz = cx - centerX, cz - centerZ
            local dist = sqrt(dx * dx + dz * dz)
            
            if (dist < MEX_RADIUS) then
                local _, _, metal = GetGroundInfo(cx, cz)
                result = 0 --104fix
                --result = result + metal
            end
        end
    end
    
    extraction = result * mult
end

------------------------------------------------
--callins
------------------------------------------------

function widget:Initialize()
    WG.Prospector = {}
    SetupMexDefInfos() 
    myTeamID = Spring.GetMyTeamID()
end

function widget:Shutdown()
    WG.Prospector = nil
end

function widget:DrawScreen()

    local mexDefInfo
    
    -- get the active command
    local _, cmdID = GetActiveCommand()
    if WG.InitialQueue and WG.InitialQueue.selDefID then
        cmdID = -WG.InitialQueue.selDefID
    end
    
    -- is it a build command
    if (not cmdID) or cmdID>=0 then 
        WG.Prospector.tooltip = nil
        return 
    end
    
    -- is a build mex command
    local unitDefID = -cmdID
    local forceUpdate = false
    if (unitDefID ~= lastUnitDefID) then 
        forceUpdate = true
    end
    lastUnitDefID = unitDefID
    mexDefInfo = mexDefInfos[unitDefID]
    
    if (not mexDefInfo) then  
        WG.Prospector.tooltip = nil
        return 
    end
    
    -- get the coord of the pos where we would build the mex if we clicked now
    local coords = {}
    if WG.MexSnap and WG.MexSnap.snappedPos then
        coords[1] = WG.MexSnap.snappedPos[1]
        coords[3] = WG.MexSnap.snappedPos[3]
    else
        local mx, my = GetMouseState()
        _,coords = TraceScreenRay(mx, my, true, true)
    end    
    if (not coords) then   
        WG.Prospector.tooltip = nil
        return 
    end
    
    -- display the tooltip
    IntegrateMetal(mexDefInfo, coords[1], coords[3], forceUpdate)
    WG.Prospector.tooltip = "\255\255\255\255Metal extraction: " .. mColour .. strFormat("%.2f", extraction)
end

