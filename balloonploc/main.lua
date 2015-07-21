-----------------------------
-- main.lua
-----------------------------

display.setStatusBar( display.HiddenStatusBar )

-- Require
require("physics" )

-- Physics Manager
physics.start( )
physics.getGravity(1)

-- Variables
local screenHeight = display.contentHeight
local screenWidth = display.contentWidth
local background = display.newImage("Images/sky.png")
local balloon = require('balloon')



test = balloon:new(250,350,"verde")
test2 = balloon:new(152,352)


-- test remove
function onMouseEvent( event )
	-- body
	test = test:rmvBalloon(test)
end



test.image:addEventListener( "touch", onMouseEvent )