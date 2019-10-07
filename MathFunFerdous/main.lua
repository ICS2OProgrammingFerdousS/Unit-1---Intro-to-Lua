 --Title: Math Fun

-- Name: Ferdous S
-- Course: ICS2O
-- This program is displays Math question-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here






--------------------------------------------------
--hide the setStatusBar
--------------------------------------------------


display.setStatusBar(display.HiddenStatusBar)
--------------------------------------------------------------
-- adding background color
--------------------------------------------------------------
display.setDefault("background", 0, 0, 0.2)

---------------------------------------------------------------
--local variables
---------------------------------------------------------------


--creating the variables
local question
local correct
local numericField
local randomOpreator
local randomNumber1
local randomNumber2
local yourAnswer
local correctAnswer
local wrongAnswer
local wrongAnswerSound = audio.loadSound("Sound/Wrong Buzzer.mp3")

--display question and set color
 -----------------------------------------------------------------
 --object creation---
 ---------------------------------------------------------------------
question= display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)

question:setTextColor(1, 0.7, 1)


--creating correct text object and its status

correct= display.newText("Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correct:setTextColor(255/255, 255/255, 255/255)
correct.isVisible=false

wrongAnswer= display.newText("Wrong answer!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
wrongAnswer:setTextColor(1, 0.4, 0.5)
wrongAnswer.isVisible=false


--creating numeric field
numericField= native.newTextField(display.contentWidth/2, display.contentHeight/2, 100, 70)
numericField.inputType="number"
--add the local function 
-------------------------------------------------------------------------------
--local functions
-------------------------------------------------------------------------------

local function askMe()
		randomOpreator = math.random(1, 2)
		-- creating 2 random number
		randomNumber1= math.random(1, 20)
		randomNumber2= math.random(1, 20)
		correctAnswer = randomNumber1 + randomNumber2 
		question.text = randomNumber1 .. "+" .. randomNumber2 .. "="
        end
local function hideAnswer( )
			correct.isVisible=false
			wrongAnswer.isVisible=false
			askMe()
		end
           
local function numrictListener( event )
		
        if(event.phase=="began") then
        elseif(event.phase=="submitted")then
            	yourAnswer= tonumber(event.target.text)
            	event.target.text = ""
        if(randomOpreator == 1)then
               correctAnswer = randomNumber1 + randomNumber2 
               question.text = randomNumber1 .. "+" .. randomNumber2 .. "="
        askMe()
        elseif(randomOpreator== 2)then
              correctAnswer = randomNumber1 - randomNumber2 
            question.text = randomNumber1 .. "-" .. randomNumber2 .. "="
         askMe()
         elseif(randomOpreator == 3)then
            	correctAnswer = randomNumber1 * randomNumber2
            	question.text = randomNumber1 .. " * " .. randomNumber2 .. "="
             askMe()
         elseif(randomOpreator == 3)then
            	correctAnswer = randomNumber1 / randomNumber2
            	question.text = randomNumber1 .. " / " .. randomNumber2 .. "="
             askMe()

		           	timer.performWithDelay(1500, hideAnswer)


		   end
		  end
        end
       

		
---------------------------------------------------------------------
--add evenet listener
----------------------------------------------------------------------        
			numericField:addEventListener("userInput", numrictListener)

----------------------------------------------------------------------
--start the game
----------------------------------------------------------------------

askMe()



   
    
   
     
     


		
           

