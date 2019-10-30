 --Title: Math Fun

-- Name: Ferdous S
-- Course: ICS2O
-- This program is displays Math question-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
  
-- Your code here
-- hide setStatusBar
display.setStatusBar(display.HiddenStatusBar)
-- adding background color
display.setDefault("background", 0, 0, 0.2)

-------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------

--creating the variables
local question
local correct
local numericField
local randomNumber1
local randomNumber2
local randomNumber3
local randomNumber4
local yourAnswer
local correctAnswer
local wrongAnswer
local point=0
local mistake = 3
--local mistake=3
--display question and set color
 -----------------------------------------------------------------
 --object creation---
 ---------------------------------------------------------------------

 
questionText= display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)

questionText:setTextColor(1, 0.7, 1)

pointText= display.newText("Point = " .. point, display.contentWidth/1.1, display.contentHeight/4.5, Arial, 35)
pointText:setTextColor(1, 0.4, 0.5)

mistakeText= display.newText("mistakes = " .. mistake, display.contentWidth/6, display.contentHeight/4.5,  Arial, 35)

--creating correct text object and its status
correct= display.newText(" Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correct:setTextColor(255/255, 255/255, 255/255)
correct.isVisible=false

wrongAnswer= display.newText("Wrong Answer!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
wrongAnswer:setTextColor(0.5,0.6,1)
wrongAnswer.isVisible=false


--creating numeric field
numericField= native.newTextField(display.contentWidth/2, display.contentHeight/2, 100, 70)
numericField.inputType="number"
--add the local function 
-------------------------------------------------------------------------------
--local functions
-------------------------------------------------------------------------------

local function askMe()
		randomOpreator = math.random(1, 4)
		-- creating 2 random number
		randomNumber1= math.random(1, 20)
		randomNumber2= math.random(1, 20)
		 if(randomOpreator == 1)then
               correctAnswer = randomNumber1 + randomNumber2 
               questionText.text = randomNumber1 .. "+" .. randomNumber2 .. "="
        askMe()
        elseif(randomOpreator== 2)then
              correctAnswer = randomNumber1 - randomNumber2 
            questionText.text = randomNumber1 .. "-" .. randomNumber2 .. "="
         askMe()
         elseif(randomOpreator == 3)then
                correctAnswer = randomNumber1 * randomNumber2
                questionText.text = randomNumber1 .. " * " .. randomNumber2 .. "="
             askMe()
         elseif(randomOpreator == 4)then
                correctAnswer = randomNumber1 / randomNumber2
                questionText.text = randomNumber1 .. " / " .. randomNumber2 .. "="
            else 

        end

local function hideAnswer( )
			correct.isVisible=false
			wrongAnswer.isVisible=false
			askMe()
		end
           
local function numrictListener( event )
		
        if(event.phase=="began") then
        elseif(event.phase=="submitted")then
            	event.target.text = ""
                yourAnswer= tonumber(event.target.text)

                   if(yourAnswer == correct) then
                    point= point + 1
                    pointText.text = "point = ".. point

                    

		           	timer.performWithDelay(1500, hideAnswer)


		   end
		  end
     end
    end


		
---------------------------------------------------------------------
--add evenet listener
----------------------------------------------------------------------        
	  numericField:addEventListener("userInput", numrictListener)

    if(event.phase=="submitted")then
    yourAnswer = tonumber(event.target.text)

    event.target.text = ""
    
    -- if the Answer get it right give them a point
    if(yourAnswer == correctAnswer) then
      point = point + 1
      pointText.text = "Point = " .. point
      correct.isVisible = true
      timer.performWithDelay(1500, HideText)

      -- if they more than 5 points display you win
      if ( point == 4) then
        -- display you win image
        youWin.isVisible= true
        
        point = 0
      end
    
    -- otherwise they get it wrong count the mistakes  
    else 
        mistake = mistake + 1
        mistakeText.text = "mistake = " .. mistake
        wrongAnswer.isVisible = true
        timer.performWithDelay(1500, HideText)
      end
      if(mistake > 3)then
      youLose.isVisible= true
      timer.performWithDelay(1500, HideText)
      youLose.isVisible=false
        mistake = 0

      end
    end      
 
---------------------------------------------
-- EVENT LISTENERS
---------------------------------------------
--calling the event listener 
numericField:addEventListener("userInput", numricListener)

---------------------------------------------
-- START THE GAME
--------------------------------------------
--call the function for asking another question
askMe()




   
    
   
     
     


		
           
