 --Title: Math Fun

-- Name: Ferdous S
-- Course: ICS2O
-- This program is displays Math question-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here








-------------------------------------------------------
--local  variables
-------------------------------------------------------
local randomOpreator
local yourAnswer
local numericField
local randomNumber1
local randomNumber2
local question
local correctAnswer

------------------------------
--background color
------------------------------
display.setDefault("background", 0, 0, 0.2)

--creating the variables

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

        
  	

	local function hideText()
		correct.isVisible =false
		wrongAnswer.isVisible=false
		end


	
local function  numricListener(event)
  randomOpreator = math.random(1, 3)
	randomNumber1 = math.random(1, 20)
	randomNumber2 = math.random(1, 25)

      -- if(event.phase=="began") then
      --    elseif(event.phase=="submitted")then
         --	yourAnswer= tonumber(event.target.text)
         	--  	event.target.text=""
         
        if(randomOpreator == 1)then
       	correctAnswer = randomNumber + randomNumber2

           question.text = randomNumber1 .."+" .. randomNumber2 .. "="
         if(yourAnswer == correctAnswer)  then

           correct.isVisible = true

      elseif(randomOpreator == 2)then
      	correctAnswer = randomNumber1 - randomNumber2
       question.text = randomNumber1 .."-" .. randomNumber2 .. "="
          elseif(randomOpreator== 3) then
          	correctAnswer = randomNumber1 *randomNumber2
       question.text = randomNumber1 .."*" .. randomNumber2 .. "="
        timer.performWithDelay(1000, hideText)
        end

		
	   end  
      end

    
   
     
     


		
           

			numericField:addEventListener("userInput", numricListener)
--calling the event listener 
--call the function for asking another question


