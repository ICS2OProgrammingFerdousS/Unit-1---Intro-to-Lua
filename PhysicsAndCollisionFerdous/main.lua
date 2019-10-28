		-----------------------------------------------------------------------------------------
		--
		 --Title: PhysicsAndCollisions
		-- Name: Ferdous Sediqi
		-- Course: ICS2O
		-- This program display physics for objects

		-- main.lua

		--
		-----------------------------------------------------------------------------------------

		-- Your code here
       ----------------------------------------------------------------------------------------------------------------
         --hiding statusbar
       ---------------------------------------------------------------------------------------------------------------
           display.setStatusBar(display.HiddenStatusBar)

		   -- start physics
		    ---------------------------------------------------------------------------------------------------
		   local physics=require("physics")
			physics.start()

			-----------------------------------------------------------------------
			--objects creations
			---------------------------------------------------------------------------
			local park=display.newImageRect("Images/road.png", 2048, 1736)
		    park.y=-100

		    physics.addBody(park, "static", {friction=0.4, bounce= 0.4})
		    local grass = display.newImageRect("Images/grass.png", 1020, 700)
		    grass.x=500
		    grass.y=700
		     local ball=display.newImageRect("Images/football.png", 40, 40)
		    ball.x=10
		    ball.y=0
		    local ball2=display.newImageRect("Images/football.png", 40, 40)
		    ball2.x=10
		    ball2.y=0
		    local ball3=display.newImageRect("Images/football.png", 40, 40)
		    ball3.x=10
		    ball3.y=0
		    local ball4=display.newImageRect("Images/football.png", 40, 40)
		    ball4.x=10
		    ball4.y=0

            

		    local beam=display.newImageRect("Images/beam_long.png", 700, 70)
		    beam.x=display.contentCenterX/10
		    beam.y=display.contentCenterY*4
		    beam.x = display.contentWidth/40
		    beam.y= display.contentHeight/1.5
		    local beam2=display.newImageRect("Images/beam.png", 700, 70)
		    beam2.x = display.contentCenterY/25
		    beam2.x=display.contentWidth/1
		    beam2.y=display.contentHeight/1.5
		   beam2:rotate(140) 
        
            

		    beam:rotate(42)
            local grass = display.newImageRect("Images/ground.png", 1730, 70)
		    grass.x=800
		    grass.y=750
		    
		    physics.addBody(beam, "static", {friction=0.5, bounce=0.3})
		    physics.addBody(grass, "static",{friction= 0.5, bounce=0.3})
		    physics.addBody(beam2, "static", {friction=0.5, bounce=0.3})

		    local park=display.newImageRect("Images/bkg.png", 0, 0)
		    park.y=display.contentCenterY
		    park.x = display.contentCenterX
		    park.x= display.contentWidth/2
		    park.y= display.contentHeight
            physics.addBody(park, "static", {friction=0.4, bounce= 0.4})

		    -------------------------------------------------------------------------
		    --local functions
		    -------------------------------------------------------------------------
		     local function firstBall( )
		     	physics.addBody(ball, {density=1.0, friction=0.5, bounce=0.9, radius=20})
		         local   musicChannel=  audio.play(backgroundMusic, {loops= -1})
		     end

		     local function secondBall( )
		     	physics.addBody(ball2, {density=1.0, friction=1.5, bounce=0.8, radius=20})
		        ball2.xScale = ball2.xScale + 1
		        ball2.yScale= ball2.yScale + 1
		     end

		     local function thirtBall( )
		     	physics.addBody(ball3, {density=1.0, friction=2, bounce=0.9, radius=20})
		     	ball3.xScale = ball3.xScale + 1.5
		     	ball3.yScale = ball3.yScale + 1.5
		    end
		    local function fourthBall( )
		     	physics.addBody(ball4, {density=1.0, friction=1.5, bounce=0.9, radius=20})
		     		ball4.xScale = ball4.xScale + 2
		     	ball4.yScale = ball4.yScale + 2
		    end
		     

		     timer.performWithDelay(1000, firstBall)
		     timer.performWithDelay(2000, secondBall)
		     timer.performWithDelay(3000, thirtBall)
		     timer.performWithDelay(4000, fourthBall)

