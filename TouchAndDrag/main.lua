		--Title: TouchAndDrag
		-- Name: Ferdous Sediqi
		-- Course: ICS2O/3C
		-- This program.. I will move the images  .-----------------------------------------------------------------------------------------
		--
		-- main.lua
		--my codes
-------------------------------------------------------------
--sound variables
-------------------------------------------------------------
local touchSound = audio.loadSound("Sounds/PopSound.wav")
local backgroundMusic = audio.loadSound("Sounds/TABL.wav")
local backgroundMusicChannel

		-- Your code here
		-- hidden the statusbar
		display.setStatusBar(display.HiddenStatusBar)
		---------------------------------------------------------------------------------------------------
		--set background
		----------------------------------------------------------------------------------------------

		local backgroundImage= display.newImageRect("Images/background.png", 5500, 2005)

		--making variables and images 
		local yellowGirl= display.newImageRect("Images/girlyellow.png", 150, 150)
		--------------------------------------------------------------------------------------------------
		--display shapes
		----------------------------------------------------------------------------------------------------
		local yellowGirlWidth= yellowGirl.width
		local yellowGirlHeight= yellowGirl.height 
		local  blueGirl = display.newImageRect("Images/girlred.png", 250, 150)
		local blueGirlWidth= blueGirl.width 
		local  blueGirlHeight= blueGirl.height
		--my boolean variables
		local  alreadyTouchedYellowGirl= false
		local alreadyTouchedBlueGirl=false
		--set position
		yellowGirl.x=400
		yellowGirl.y=500
		blueGirl.x=300
		blueGirl.y=200
-- function for backgroundMusic
local function music( event )
local backgroundMusicChannel = audio.play(backgroundMusic)

end
		--my function for making it to do job
		local  function blueListener( touch )

			if(touch.phase == "began")then

				if(alreadyTouchedYellowGirl == false) then

				 alreadyTouchedBlueGirl = true
				 local touchSound = audio.play(touchSound)

				end
			end

			if ((touch.phase == "moved") and (alreadyTouchedBlueGirl==true))then


				blueGirl.x = touch.x

				blueGirl.y= touch.y
			end

			if(touch.phase == "ended") then

				alreadyTouchedBlueGirl= false

				alreadyTouchedYellowGirl= false
			end
		   end


		blueGirl:addEventListener("touch", blueListener)

		local function yellow( touch )
			
			if(touch.phase == "began") then
		       
		       if(alreadyTouchedBlueGirl== false) then
		        
		        alreadyTouchedYellowGirl = true
		        local touchSound = audio.play(touchSound)

		    end
		   end

		    if((touch.phase == "moved") and (alreadyTouchedYellowGirl== true)) then
		        	yellowGirl.x = touch.x

		        	yellowGirl.y= touch.y
		    end
		    if(touch.phase == "ended") then
		       alreadyTouchedBlueGirl= false
		       alreadyTouchedYellowGirl= false
		     end
		    end
		-------------------------------------------------------------------------------------------------------------------------
		--calling the function 
		-------------------------------------------------------------------------------------------------------------------------
		yellowGirl:addEventListener("touch", yellow )
