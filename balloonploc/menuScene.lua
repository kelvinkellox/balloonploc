-----------------------------
-- menuScene.lua
-----------------------------

-- Start Scene
local composer = require("composer")
local scene = composer.newScene()
local widget = require( "widget" )
local balloon = require( "balloon")

--Display size
local _W = display.contentWidth
local _H = display.contentHeight
--Variables
local background,btnPlay,btnCredits,btnConfig,tmAnim,startPosX,startPosY
--Variables to Animation
local tableBalloons = {} -- tabke for create objects
local maxNumBalloons = 15 -- max number of balloons
local currentNumber = 1 -- current number to index
local balloonGroup = display.newGroup() -- group to insert balloons
local balloonCount = 0;



--Function to change scene to gameScene
local function onBtnPlayRelease()
	return true
end
--Function to change scene to configScene
local function onBtnConfigRelease()
	return true
end
--Function to change scene to creditsScene
local function onBtnCreditsRelease()
	return true
end


local function onTimeAnim()
	local delayTime = 4000 -- value of animation delay
	local startPosX = math.random( 0,_W  )
	local startPosY = _H
    local balloonColor = math.random( 1,#C.STR_TABLE_BALLOON_COLOR)

    if(currentNumber <= maxNumBalloons) then
        --Create balloon and insert in a group
        tableBalloons[currentNumber] = balloon:new(startPosX,startPosY,balloonColor)
        balloonGroup:insert(tableBalloons[currentNumber].image)

        --Remove display and clear object
        local function animOnComplete(target)
            target:removeSelf()
            target = nil
        end

        --Move the balloon to top of the screen and call animOnComplete function
        transition.to(tableBalloons[currentNumber].image, {time = delayTime, x= tableBalloons[currentNumber].x, y = 0, onComplete=animOnComplete} )
        currentNumber = currentNumber + 1

        --If index is higher than maxNumberBalloons then set index to 1.
        if(currentNumber > maxNumBalloons) then
            currentNumber = 1
        end

    end
end

local function createButtons()
    -- Create Play Button
    btnPlay = widget.newButton
    {
        width = C.RSC_MENU_BUTTON_SCALE_X,
        height = C.RSC_MENU_BUTTON_SCALE_Y,
        defaultFile = C.IMG_MENU_BUTTON,
        label = C.STR_BUTTON_PLAY,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        onEvent = onBtnPlayRelease
    }
    btnPlay.anchorY = 0.5
    btnPlay.anchorX = 0.5
    btnPlay.x = display.contentWidth * 0.5
    btnPlay.y = display.contentHeight * 0.35

    --Create Config Button
    btnConfig = widget.newButton
    {
        width = C.RSC_MENU_BUTTON_SCALE_X,
        height = C.RSC_MENU_BUTTON_SCALE_Y,
        defaultFile = C.IMG_MENU_BUTTON,
        label = C.STR_BUTTON_CONFIG,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        onEvent = onBtnConfigRelease
    }
    btnConfig.anchorY = 0.5
    btnConfig.anchorX = 0.5
    btnConfig.x = display.contentWidth * 0.5
    btnConfig.y = display.contentHeight * 0.5 

    --Create Credits Button
    btnCredits = widget.newButton
    {
        width = C.RSC_MENU_BUTTON_SCALE_X,
        height = C.RSC_MENU_BUTTON_SCALE_Y,
        defaultFile = C.IMG_MENU_BUTTON,
        label = C.STR_BUTTON_CREDITS,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        onEvent = onBtnCreditsRelease
    }
    btnCredits.anchorY = 0.5
    btnCredits.anchorX = 0.5
    btnCredits.x = display.contentWidth * 0.5
    btnCredits.y = display.contentHeight * 0.65

    return true

end


-- "scene:create()"
function scene:create(event)

	local sceneGroup = self.view

	--Insert the background and position it
	background = display.newImageRect(C.IMG_BACKGROUND,_W , _H)
	background.x = _W * 0.5 
	background.y = _H * 0.5
	sceneGroup:insert( background)

	--Create and insert buttons into sceneGroup
    createButtons()
    sceneGroup:insert( btnPlay )
    sceneGroup:insert( btnCredits )
    sceneGroup:insert( btnConfig )

	-- Place the buttons to Foward 
	sceneGroup:insert(balloonGroup)
    btnPlay:toFront( )
    btnCredits:toFront( )
    btnConfig:toFront( )



    tmAnim = timer.performWithDelay( 1000, onTimeAnim,0)

end

-- "scene:show()"
function scene:show(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then

	elseif (phase == "did" ) then

	end

end

-- "scene:hide()"
function scene:hide(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then

	elseif (phase == "did") then

	end

end

-- "scene:destroy()"
function scene:destroy(event)

	local sceneGroup = self.view

end

----------------------------------------------------------
--Listener setup

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

----------------------------------------------------------

return scene