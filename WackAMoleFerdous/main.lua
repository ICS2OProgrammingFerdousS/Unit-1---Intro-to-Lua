	------------ Title: WhackAMole
	-- Name: Ferdous Sediqi
	-- Course: ICS2O
	-- This program...
	-------------------------------------------------------------------------------
	--
	-- main.lua
	--
	-----------------------------------------------------------------------------------------

	-- Your code here





		
	-- hide the status bar
	display.setStatusBar (display.HiddenStatusBar)

	-----------------------------------------------------------------------------------------
	-- LOCAL VARIABLES
	-----------------------------------------------------------------------------------------
    
      local backgroundMusic = audio.loadStream("Sounds/whack.mp3")
      local msicChannel
	-- create lives
	local lives = 5

	-- create points
	local points = 0

	-- win image
	local win

	-- lose image
	local lose

	-- create the background
	local bkg = display.newImageRect("Images/bkg.jpg", 1024, 768)
		
		-- setting pos
		bkg.anchorX = 500
		bkg.anchorY = 300
		bkg.x = 1024
		bkg.y = 768

	-- creating mole
	local mole = display.newImage( "Images/mole2.png", 0, 0)

		-- setting pos
		mole.x = display.contentCenterX
		mole.y = display.contentCenterY

		-- scale down size of the mole to be 1/3 of original size
		mole.width = display.contentWidth/3
		mole.height = display.contentHeight/3


	-----------------------------------------------------------------------------------------
	-- FUNCTION
	-----------------------------------------------------------------------------------------


	function PopUp()

		-- Choosing random pos on the screen between 0 and the size of the screen
		mole.x = math.random( 0, display.contentWidth )
		mole.y = math.random( 0, display.contentHeight )

		-- mole isn't visible YET
		mole.isVisible = true

		-- call the mole after 500 milliseconds
		timer.performWithDelay( 1000, Hide)
	end

	-- this function calls the PopUp function after 3 seconds
	function PopUpDelay( )
		timer.performWithDelay( 2000, PopUp)
	end

	-- this function makes the mole invisible and then calls the PopUpDelay function
	function Hide( )

		--changing Visibility
		mole.isVisible = false

		--call the PopUpDelay function
		PopUpDelay()
	end

	-- this function starts the game
	function GameStarts( )
		PopUpDelay()
	local   musicChannel=  audio.play(backgroundMusic, {loops= -1})

	end

	-- this function invcements the score only if the mole is clicked. It then displays the
	-- new score.
	function Whacked( event )

		--if touch phase just started
		if (event.phase == "began") then
			-- give a point if user clicks the mole
			points = points + 1
			PopUp()
			-- update it in the display object
			pointsText.text = "points = " .. points

			-- add timer
			timer.performWithDelay(2000, HidePoints)

			-- show "you win!" after 5 points		
			if (points == 5) then
				winObject.isVisible = true
				timer.performWithDelay(2000, HideWin)
			end
		else
			-- take away a life if user misses mole
			lives = lives -1

			-- update it in the display object
			livesText.text = "lives = " .. lives

			-- add timer
			timer.performWithDelay(2000, HideLives)

			-- show "you lose!" after o lives		
			if (lives == 5) then
				winObject.isVisible = false
				timer.performWithDelay(2000, HideLose)
			end
		end

	end

	-----------------------------------------------------------------------------------------
	-- EVENT LISTENER
	-----------------------------------------------------------------------------------------
	-- i add the event listener to the moles so that if the mole is touched, the Whacked 
	-- function is called
	mole:addEventListener( "touch", Whacked)
	GameStarts()
	-----------------------------------------------------------------------------------------
	-- OBJECTS
	-----------------------------------------------------------------------------------------

	-- display the amount of points as a text object
	pointsText = display.newText("point = " .. points, 150, 33, nil, 50)
	pointsText:setTextColor(0.3, 0.3, 1)

	-- display the amount of lives as a text object
	livesText = display.newText("lives = " .. lives, 888, 33, nil, 50)
	livesText:setTextColor(0.3, 0.3, 1)

	-- create the win image and make it invisible
	winObject = display.newImageRect("Images/win.png", 512, 382)
	winObject.x =  display.contentWidth/2
	winObject.y = display.contentHeight/2
	winObject.isVisible = false

	-- create the lose image and make it invisible
	loseObject = display.newImageRect("Images/lose.png", 512, 384)
	loseObject.x =  display.contentWidth/2
	loseObject.y = display.contentHeight/2
	loseObject.isVisible = false

