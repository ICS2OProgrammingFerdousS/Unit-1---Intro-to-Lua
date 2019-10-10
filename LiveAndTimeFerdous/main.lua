-----------------------------------------------------------------------------------------
--
-- main.lua
--TRime and life 
--
--
-----------------------------------------------------------------------------------------

-- Your code here
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
local youWin 
local youLose
local randomOpreator


--------------------------------------------------------------------
--variables for 
---------------------------------------------------------------------

-------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------
-- inseting the images and make their sizes
local youWin = display.newImageRect("Images/you-win.jpg", 200, 200)
local youLose = display.newImageRect("Images/game over.png", 200, 200)
youWin.x = 500
youWin.y = 600
youLose.x = 500
youLose.y = 600

youWin.isVisible=false
youLose.isVisible = false


--display question and set color
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
    randomOpreator = math.random(1, 4)
    -- creating 2 random number
    randomNumber1= math.random(1, 10)
    randomNumber2= math.random(1, 10)

    if(randomOpreator == 1)then
               correctAnswer = randomNumber1 + randomNumber2 
               question.text = randomNumber1 .. "+" .. randomNumber2 .. "="
    elseif(randomOpreator== 2) then
               correctAnswer = randomNumber1 - randomNumber2 
                question.text = randomNumber1 .. "-" .. randomNumber2 .. "="
       if(randomNumber1 < randomNumber2) then
       question.text = randomNumber2 .. " * " .. randomNumber1 .. "="
  
    elseif(randomOpreator == 3) then
                correctAnswer = randomNumber1 * randomNumber2
                question.text = randomNumber1 .. " * " .. randomNumber2 .. "="
    elseif(randomOpreator == 4) then
                correctAnswer = randomNumber1 / randomNumber2
                question.text = randomNumber1 .. " / " .. randomNumber2 .. "="
     end

  end
 end
        
local function HideText( )
    correct.isVisible=false
    wrongAnswer.isVisible=false
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
        mistake = 0

      end
    end      
   end
   