-----------------------------------------------------------------------------------------
-- Title: point

-- Name: Ferdous S
-- Course: ICS2O
--playing math gasme-- 
--main.lua
--
-----------------------------------------------------------------------------------------
-- Your code here

-----------------------------------------------------------------------------------------
--
-- main.lua
--Ferdous S
-- Calculation game

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

local yourAnswer
local correctAnswer
local wrongAnswer
local point=0
local mistake =0
local CorrectSound = audio.loadSound("Sounds/CorrectSound.mp3")
local wrongSound = audio.loadSound("Sounds/wrongSound.mp3")
local CorrectSoundCehnnel
local wrongChennel
local youWin
local youLost

--local wrongAnswerSound = audio.loadSound("Sound/Wrong Buzzer.mp3")

-------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------


--display question and set color
youWin =display.newText("You win ",display.contentWidth/2, display.contentHeight*2/3, nil, 50)
  youWin.isVisible= false
youLost = display.newText("You lost ",display.contentWidth/2, display.contentHeight*2/3, nil, 50)
youLost.isVisible=false

question= display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
question:setTextColor(1, 0.7, 1)

pointText= display.newText("Point = " .. point, display.contentWidth/1.1, display.contentHeight/4.5, Arial, 35)
pointText:setTextColor(1, 0.4, 0.5)

mistakeText= display.newText("mistake = " .. mistake, display.contentWidth/6, display.contentHeight/4.5,  Arial, 35)


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

------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------
 
local function askMe( )
	-- creating 2 random number
	randomNumber1= math.random(1, 10)
	randomNumber2= math.random(1, 10)
	correctAnswer = randomNumber1 + randomNumber2 
	question.text = randomNumber1 .."+" .. randomNumber2 .. "="
end
		
local function HideText( )
	correct.isVisible=false
	wrongAnswer.isVisible=false
  youWin.isVisible=false
  youLost.isVisible=false
	askMe()
end
           
local function numricListener(event)
  if(event.phase=="began") then

  elseif(event.phase=="submitted")then
    yourAnswer = tonumber(event.target.text)

    event.target.text = ""
    
    -- if the Answer get it right give them a point
    if(yourAnswer == correctAnswer) then
      point = point + 1
            correct.isVisible = true

       CorrectSoundCehnnel = audio.play(CorrectSound)

      pointText.text = "Point = " .. point
      correct.isVisible = true
      timer.performWithDelay(1500, HideText)

      -- if they more than 5 points display you win
      if ( point == 4) then
        -- display you win image
      youWin.isVisible = true
      point= 0
      timer.performWithDelay(100, HideText)
      
      end
      else 
        mistake = mistake + 1
        wrongAnswer.isVisible = true
        wrongChennel = audio.play(wrongSound)

        mistakeText.text = "mistake =" .. mistake
        timer.performWithDelay(1500, HideText)
    end
      if(mistake > 3)then
        youLost.isVisible = true
        mistake = 0
        timer.performWithDelay(1500, HideText)

        mistake = 0

      end
    end      
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

