-- Title: AreaOfRectangleAndCircle

-- Name: Ferdous S
-- Course: ICS2O
-- This program is displays a AreaOfRectangleAndCircle
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
--create my variable
local areaText
local textSiz=40
local widthOfRectangle = 40
local myRectangle
local hightOfRectangle=200
local areaOfRectangle
-- this code is for backgrouncolor
display.setDefault("background", 250/100,100/250, 100/250)
--draw rectangle
myRectangle= display.newRect(0, 0, widthOfRectangle, hightOfRectangle )

--positionning rectangle
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x=20
myRectangle.y=20
--set width for border

myRectangle.strokewidth=20

--set color for rectangle
myRectangle:setFillColor(0.5, 0.2, 0.6)
--set color for border-
myRectangle:setstrokecolor(1,1,1)