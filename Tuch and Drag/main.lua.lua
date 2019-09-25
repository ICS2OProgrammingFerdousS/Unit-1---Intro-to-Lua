--- Title: AreaOfRectangleAndCircle

-- Name: Ferdous S
-- Course: ICS2O
-- This program is displays a AreaOfRectangleAndCircle

--local variables
local backgroundImage= display.newImageRect("Images/background.png" 2000, 3000)
local yellowGirl= display.newImageRect("Images/girl1.png", 150, 150)
local yellowGirlWidth= yellowGirl.width
local yellowGirlHeight= yellowGirl.height 

local  blueGirl = display.newImageRect("Images/girl2.png", 250, 150)
local blueGirlWidth= blueGirl.width 
local  blueGirlHeight= blueGirl.height

--my boolean variables
local  alreadyTuchedYellowGirl= false
local alreadyTuchedBlueGirl=false


--set position
yellowGirl.x=400
yellowGirl.y=500

blueGirl.x=300
blueGirl.y=200


--my function
 local  function bluelitener( touch )
 if(touch.phase == "began")then
 alreadyTuchedBlueGirl = true
end

end
if ((touch.phase == "moved") and (alreadyTuchedBlueGirl==true))then
	blueGirl.x = touch.x
	blueGirl.y= touch.y
	end

	if(touch.phase == "ended") then
		alreadyTuchedBlueGirl= false
		alreadyTuchedYellowGirl= false
		end

blueGirl.addEventListener("touch", bluelitener)
