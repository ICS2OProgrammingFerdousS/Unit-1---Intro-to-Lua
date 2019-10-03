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

--creating the variables

	local question
	local correct
	local numericField
	local randomNumber1
	local randomNumber2
	local yourAnswer
	local correctAnswer
	local wrongAnswer
	local wrongAnswerSound = audio.loadSound("Sound/Wrong Buzzer.mp3")

--display question and set color

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
         

           	yourAnswer= tonumber(event.target.text)

                  	event.target.text=""


           if(yourAnswer== correctAnswer) then
           	correct.isVisible= true
          	timer.performWithDelay(2000, hideAnswer)

            else 
             
           	wrongAnswer.isVisible=true
           	--adding sound track for wrongAnswer
             local wrongAnswerSound = audio.play(wrongAnswerSound)
            --giving the time for showing the answer
           	timer.performWithDelay(1500, hideAnswer)
			end
	  	    end
        	end

        
--calling the event listener 
			numericField:addEventListener("userInput", numricListener)
--call the function for asking another question
         askMe()

