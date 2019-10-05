-----------------------------------------------------------------------------------------
--
-- main.lua
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
local textSize=9

--local wrongAnswerSound = audio.loadSound("Sound/Wrong Buzzer.mp3")

-------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------

--display question and set color
question= display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
question:setTextColor(1, 0.7, 1)

pointText= display.newText("point = " .. point, display.contentWidth/1.1, display.contentHeight/4.5, " pixels", Arial,"textSize")
pointText:setTextColor(1, 0.4, 0.5)

--mistakeText= display.newText("mistake = " .. mistake, display.contentWidth/6, display.contentHeight/4.5, " pixels", Arial,"textSize")

--pointText=50

--creating correct text object and its status

correct= display.newText(" Congratulation you won!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correct:setTextColor(255/255, 255/255, 255/255)
correct.isVisible=false

wrongAnswer= display.newText("Game over!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
wrongAnswer:setTextColor(0.5,0.6,1)
wrongAnswer.isVisible=false


--creating numeric field
numericField= native.newTextField(display.contentWidth/2, display.contentHeight/2, 100, 70)
numericField.inputType="number"

------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------
 
local function askMe( event )
	-- creating 2 random number
	randomNumber1= math.random(0, 10)
	randomNumber2= math.random(0, 10)
	correctAnswer = randomNumber1 + randomNumber2 
	question.text = randomNumber1 .."+" .. randomNumber2 .. "="
end
		
local function hideAnswer( )
	correct.isVisible=false
	wrongAnswer.isVisible=false
	askMe()
end
           
			local function numricListener(event)
            if(event.phase=="began") then

            elseif(event.phase=="submitted")then
             yourAnswer = tonumber(event.target.text)

            event.target.text=''
            askMe()
           pointText.text = "point = " ..point

           if(yourAnswer == correctAnswer) then
          point = point + 1


               	--adding sound track for wrongAnswer
             --local wrongAnswerSound = audio.play(wrongAnswerSound)

                         --giving the time for showing the answer
   


            --adding sound track for wrongAnswer
            --local wrongAnswerSound = audio.play(wrongAnswerSound)

            --giving the time for showing the answer
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

