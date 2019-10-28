-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-------------------------------------------------------------------------------------------
--variables for soundeffects

----------------------------------------------------------------------------------------
--variables for soundeffects
---------------------------------------------------------------------------------------


	display.setDefault("background", 1, 1,0.7)
	local firstButton= display.newImageRect("Images/Fast Button Inactive@2x.png", 197, 96)
firstButton.x = display.contentWidth/ 2
firstButton.y = display.contentHeight/2
firstButton.isVisible= true

-- creating second button
	local  secondButton= display.newImageRect("Images/Fast Button Active@2x.png", 197, 96)
secondButton.x= display.contentWidth/2
secondButton.y=display.contentHeight/2
secondButton.isVisible= false
local wrongSound = audio.loadSound("Sounds/Wrong Buzzer.mp3")


local myCross=display.newImageRect("Images/red_x.png", 197, 96)

myCross.x=display.contentWidth/2
myCross.y=display.contentHeight/3
myCross.isVisible=false

	local writeText= display.newText("Clicked", 0, 0, nil, 30)
writeText.x=display.contentWidth/2
writeText.y=display.contentHeight/3
writeText:setTextColor(1, 0.6, 0.5)
writeText.isVisible=false

local function mybutton( touch )
	if(touch.phase =="began") then
		firstButton.isVisible=false
		secondButton.isVisible=true
		writeText.isVisible= true
	end
	if(touch.phase=="ended")then

	firstButton.isVisible=true
	secondButton.isVisible=false
	writeText.isVisible= false
	       myCross.isVisible=false

	end
	end
	firstButton:addEventListener("touch", mybutton)

    local function mySecondButton( touch )
      if(touch.phase=="began")then
      	secondButton.isVisible= false
      	firstButton.isVisible= true
      	myCross.isVisible=true
 local wrongSound = audio.play(wrongSound)
    end
    if(touch.phase=="ended")then

    secondButton.isVisible=true
    firstButton.isVisible= false
        writeText.isVisible=false

    end
    end

    secondButton:addEventListener("touch", mySecondButton)