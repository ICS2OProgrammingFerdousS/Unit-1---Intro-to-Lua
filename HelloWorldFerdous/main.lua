-----------------------------------------------------------------------------------------
--
-- main.lua
--here is the commenting code to add:
-- Title: HelloWorld
-- Name: Ferdous Sediqi
-- Course: ICS2O
-- This program displays Hello to the simulator and to the command terminal.-----------------------------------------------------------------------------------------

-- Your code here
--print to commend terminal
print("Hello World!!")
print("this class is Aowsem")

--hidden the setStatusBar
display.setStatusBar(display.HiddenStatusBar)

--sets background color
display.setDefault("background", 124/255, 249/255, 100/255)

-- create a local variable
local ferdousObject
ferdousObject= display.newText("Ferdous Sediqi", 500, 400, nil, 50)

ferdousObject:setTextColor(155/255, 130/255, 150/255)
--make new variable
local ferdousObjectSigauture
--make ne text
ferdousObjectSigauture = display.newText("By:Ferdous", 500, 500, nil, 50)

ferdousObjectSigauture:setTextColor(155/255, 30/255, 50/255)