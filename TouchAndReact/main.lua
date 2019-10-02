-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

display.setDefault("background", 1, 1,0.7)

local firstButton= display.newImageRect("Images/ Fast Button Active@2x.png", 197, 96)
firstButton.x= 500
firstButton.y= 400
firstButton.isVisible= true

-- creating second button
local  secondButton= display.newImageRect("Images/ Fast Button Inactive@2x.png", 197, 96)
--secondButton