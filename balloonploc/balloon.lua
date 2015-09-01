-----------------------------
-- balloon.lua 
-----------------------------
--require Constants
local C = require("constants" )

local balloon = {}
local balloon_mt = {__index = balloon} -- metatable
	

	function balloon:new( posX, posY, colorNum) -- constructor

		local newBalloon = {}
		--Display Image and set color
		newBalloon.image = display.newImage(C.IMG_BALLOON)
		newBalloon.image.bColor = colorNum

		--Tint balloon
		local function Blue()
			newBalloon.image:setFillColor( 0,0,255 )
		end
		local function Red()
			newBalloon.image:setFillColor( 255,0,0 )
		end
		local function Green()
			newBalloon.image:setFillColor( 0,255,0 )
		end
		local function Yellow()
			newBalloon.image:setFillColor( 255,255,0 )
		end

		local color = {Blue,Red,Green,Yellow}
		tintBalloon = color[colorNum]
		tintBalloon()

		-- Set position of object
		newBalloon.image.x = posX
		newBalloon.image.y = posY


		setmetatable( newBalloon, balloon_mt )
		return newBalloon
	end





return balloon