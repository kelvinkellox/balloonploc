-----------------------------
-- balloon.lua 
-----------------------------
local balloon = {}
local balloon_mt = {__index = balloon} -- metatable
	

	function balloon:new( posX, posY, color) -- constructor

		local newBalloon = {}
		--Display Image and set color
		newBalloon.image = display.newImage("Images/balaoteste.png")
		newBalloon.bColor = color

		-- Set position and physics of object
		physics.addBody( newBalloon.image, { density=2.0, friction=0, bounce=0, radius=15 })
		newBalloon.image.x = posX
		newBalloon.image.y = posY
		newBalloon.image.gravityScale = -0.10


		setmetatable( newBalloon, balloon_mt )
		return newBalloon
	end

	-- Remove Display from object and return nil
	function balloon:rmvBalloon(obj)
		obj.image:removeSelf( )
		return nil
	end

return balloon