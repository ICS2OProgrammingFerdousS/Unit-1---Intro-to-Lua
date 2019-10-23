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

		    grass.x=display.contentWidth/2

		    local beam=display.newImageRect("Images/shadow.png", 700, 200)
		    beam.x=display.contentCenterX/10
		    beam.y=display.contentCenterY*1.65
		    beam.x = display.contentWidth/5
		    beam.y= display.contentHeight/2

		    beam:rotate(25)
		    
		    physics.addBody(beam, "static", {friction=0.1, bounce=1})
		    physics.addBody(grass, "static",{friction= 0.1, bounce=0.2})
		   
		    -------------------------------------------------------------------------
		    --local functions
		    -------------------------------------------------------------------------
		     local function firstBall( )
		     	physics.addBody(ball, {density=1.0, friction=0.5, bounce=0.3, radius=25})
		     end

		     local function secondBall( )
		     	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=30})
		        ball2.xScale = ball2.xScale + 1
		        ball2.yScale= ball2.yScale + 1
		     end

		    -- local function thirtBall( )
		     	--physics.addBody(ball3, {density=1.0, friction=0.5, bounce=0.3, radius=25})
		    -- end
		     --local function fourthBall( )
		     	--physics.addBody(ball4, {density=1.0, friction=0.5, bounce=0.3, radius=25})
		    -- end

		     timer.performWithDelay(5, firstBall)
		     timer.performWithDelay(8, secondBall)
		    -- timer.performWithDelay(10, thirtBall)
		    -- timer.performWithDelay(13, fourthBall)

