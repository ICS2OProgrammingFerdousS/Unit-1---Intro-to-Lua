--Title: imageMovien

-- Name: Ferdous S
-- Course: ICS2O
-- This displays an image to move
----------------------------------------------------------------------------
--HiddenStatusBar
------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
---------------------------------------------------------------------------
--------------------------------------------------------------------------
--move sound variables
--------------------------------------------------------------------------

local moveSound = audio.loadStream("Sound/bensound.mp3")
local movesSoundChennel 
---------------------------------------------------------------------------------------------------------------------------
--make a global variable
scrollSpeed = 2
--bacground image with width and height
local  bacgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
-------------------------------------
--character images height and width
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)
--another image
--set the image transprent
beetleship.alpha = 0



--set x and y position
beetleship.x = 0

beetleship.y = display.contentHeight/3
--secondShip


--function for moving image
local function moveShip( event )
	beetleship.x = beetleship.x + scrollSpeed
	movesSoundChennel = audio.play(moveSound)

	beetleship.alpha = beetleship.alpha + 0.01

end

Runtime:addEventListener("enterFrame", moveShip)


scrollSpeed = 2


local  secondShip =display.newImageRect("Images/octopus.png", 200, 200)

secondShip.alpha = 0

secondShip:scale(-1, 1)

secondShip.x = 900

secondShip.y = display.contentHeight/1.5

function mymoving( event )
	secondShip.x = secondShip.x -scrollSpeed
	
	secondShip.alpha= secondShip.alpha + 0.05 

end
timer:performWithDelay("enterFrame", mymoving)
