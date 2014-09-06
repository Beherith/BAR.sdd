
----------------------------------------------------------------
-- global variables
----------------------------------------------------------------
local versionNumber = "v1.2"
local delay = 8
local endTime
local mx,my

----------------------------------------------------------------
-- speedups
----------------------------------------------------------------
local DiffTimers = Spring.DiffTimers
local GetTimer = Spring.GetTimer
local SendCommands = Spring.SendCommands
local Echo = Spring.Echo
local GetMouseState = Spring.GetMouseState

----------------------------------------------------------------
-- callins
----------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Autoquit",
    desc      = "Automatically quits "..delay.."s after the game ends",
    author    = "Evil4Zerggin & zwzsg",
    date      = "25 December 2008",
    license   = "GNU LGPL, v2.1 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

function widget:Initialize()
  endTime = false
end

function widget:GameOver()
  endTime = GetTimer()
  mx,my = GetMouseState()
  Echo("Automatically exiting in " .. delay .. " seconds, move mouse to cancel")
end

function widget:Update(dt)
  if endTime then
    local nmx,nmy = GetMouseState()
    if nmx~=mx or nmy~=my then
      --Echo("<autoquit> Autoquit canceled.")
      endTime = false
      -- widgetHandler:RemoveWidget()
    elseif DiffTimers(GetTimer(), endTime) > delay then
      Echo("Automatically exiting")
      SendCommands("quitforce")
    end
  end
end
