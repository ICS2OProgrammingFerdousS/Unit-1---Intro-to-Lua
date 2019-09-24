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
local textSize=40
local widthOfRectangle = 40
local myRectangle
local hightOfRectangle=200
local areaOfRectangle
-- this code is for backgrouncolor
display.setDefault("background", 250/100,100/250, 100/250)
--draw rectangle that is half of the width and height of screen
myRectangle = display.newRect(0, 0,  widthOfRectangle, heightOfRectangle )

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

myRectangle:setStrokecolor(0, 1, 0)
--calculation
areaOfRectangle= widthOfRectangle * heightOfRectangle
areaText = display.newText("the are of the Rectangle with the width of ".. widthOfRectangle .." and heigh of " .. heightOfRectangle.." is "..areaOfRectangle.. "pixels", 0,0, Arial, textSize )
-- anchor the text and set x, y position

areaText.anchorX=20
areaText.anchorY= 20
areaText.x= 20
areaText.y=display.contentHeight/2
-- set the color for text
areaText:setTextColor(1,1,1)