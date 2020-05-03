

Util={}

local ball=nil
local board=nil
local camera=nil

local function GetBoard()
    if board ==nil then
        board=require "GameLogic.Board"
    end
    
    return board
end

local function GetBall()
    if ball ==nil then
        ball=require "GameLogic.Ball"
    end
    
    return ball
end

local function GetCamera()
    if camera == nil then
        camera=require "GameLogic.Camera"
    end
    return camera
end

Util.GetBoard=GetBoard
Util.GetBall=GetBall
Util.GetCamera=GetCamera

return Util;

