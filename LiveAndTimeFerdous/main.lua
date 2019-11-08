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
    display.setDefault("background", 200/255, 200/255, 200/255)

    -------------------------------------------------
    -- LOCAL VARIABLES
    -------------------------------------------------

    --creating the varia

    --------------------------------------------------------------------
    --variables for timer
    ---------------------------------------------------------------------
    local totalSeconds = 10
    local secondsLeft = 10
    local clockText
    local countDownTimer
    local lives = 4
    local heart1 
    local heart2
    local point = 0
    local backgroundMusic= audio.loadStream("Sound/whack.mp3.mp3")
    local musicChannel

    --local wrongAnswerSound = audio.loadSound("Sound/Wrong Buzzer.mp3")

    -------------------------------------------------
    -- OBJECT CREATION
    --------------------------------------------------


    local question
    local correct

    local numericField
    local randomNumber1
    local randomNumber2

    local yourAnswer
    local correctAnswer
    local wrongAnswer
    local mistake =0
    local youWin 
    local youLose
    local secondsLeftText
    local wrongSound = audio.loadSound("Sounds/Wrong Buzzer.mp3")

    --local wrongAnswerSound = audio.loadSound("Sound/Wrong Buzzer.mp3")

    -------------------------------------------------
    -- OBJECT CREATION
    --------------------------------------------------
     
      youWin = display.newImageRect("Images/you-win.jpg", 200, 200)
      youLose = display.newImageRect("Images/game over.png", 200, 200)
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

     clockText= display.newText(secondsLeft, display.contentWidth/7, display.contentHeight/7, nil, 50)


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

    ---creating the variables---------------------------------------------------
    --creating lives display
    ---------------------------------------------------------------------------
      heart1 = display.newImageRect("Images/heart.png", 100, 100 )
      heart1.x = 950
      heart1.y = 75

      heart2 = display.newImageRect("Images/heart.png", 100, 100)
      heart2.x = 850
      heart2.y = 75

      heart3 = display.newImageRect("Images/heart.png", 100, 100)
      heart3.x = 760
      heart3.y = 75

      heart4 = display.newImageRect("Images/heart.png", 100, 100)
       heart4.x=660
      heart4.y=75
-------------------------------------------------------------------------------

------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------

    local function askMe( )
    local musicChannel = audio.play(backgroundMusic, {loops= -1})

        -- creating 2 random number
        randomNumber1= math.random(1, 10)
        randomNumber2= math.random(1, 10)
        correctAnswer = randomNumber1 + randomNumber2 
        question.text = randomNumber1 .."+" .. randomNumber2 .. "="
    end
          
      local function HideText( )
          correct.isVisible=false
          wrongAnswer.isVisible=false
          askMe()
      end

      local function UpdateTime( )
        secondsLeft = secondsLeft - 1
        clockText.text = secondsLeft .. ""
        if(secondsLeft == 0)then
          secondsLeft = totalSeconds
          lives = lives - 1
        
        elseif(lives < 1)then
          heart1.isVisible=false
          youWin.isVisible=true

        end
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
         secondsLeft = totalSeconds

          timer.performWithDelay(1500, HideText)

          -- if they more than 5 points display you win
          if ( point > 4) then
            -- display you win image
            youWin.isVisible= true

            point = 0
          end

        -- otherwise they get it wrong count the mistakes  
        else 
      lives = lives - 1

     if(lives == 3)then
       local wrongSound = audio.play(wrongSound)
        heart4.isVisible = false
        askMe()

      elseif(lives == 2)then
        heart3.isVisible = false
        secondsLeft=totalSeconds
        askMe()

      elseif(lives== 1)then
        heart2.isVisible=false
        askMe()

      elseif(lives==0)then
        heart1.isVisible=false  
        wrongAnswer.isVisible = true
        timer.performWithDelay(1500, HideText)
        
        if(lives < 1)then
          youLose.isVisible=true

        end      
      end
     end
    end
   end

    local  function startTimer( )
      countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)

      
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
startTimer()
askMe()
