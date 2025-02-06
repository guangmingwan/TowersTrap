-----------------------
-- NO: A game of numbers
-- Created: 23.08.08 by Michael Enger
-- Version: 0.2
-- Website: http://www.facemeandscream.com
-- Licence: ZLIB
-----------------------
-- Handles buttons and such.
-----------------------

Weapons = {}
Weapons.__index = Weapons

function Weapons.create(x, y)
	
	local temp = {}
	setmetatable(temp, Weapons)
	temp.hover = false -- whether the mouse is hovering over the button
	temp.click = false -- whether the mouse has been clicked on the button
	temp.name = "" -- the text in the button
	temp.width = 40*7
	temp.height = 40
	temp.selected = -1
	temp.x = x
	temp.y = y
	temp._x = x - 40*7 /2
	temp._y = y - (40 /2)
	return temp
end

function Weapons:getSelected()
	return self.selected;
end

function Weapons:draw()
    if not self.hover then
        love.graphics.setColor(color["menu_bg"])
        love.graphics.rectangle("fill", self._x, self._y, self.width, self.height)
        if debug then
            love.graphics.print("weapons leave", battlearea.left + 100, battlearea.top + 120) 
        end
    else
        if debug then
            love.graphics.setColor(color["menu_bg"])
            love.graphics.print("weapons hover", battlearea.left + 100, battlearea.top + 120) 
        end
    end

    -- 绘制武器图形
    love.graphics.draw(graphics["weapons"], self._x, self._y)

    if debug then
        love.graphics.setColor(color["menu_bg"])
        love.graphics.print("weapons selected: " .. self.selected, battlearea.left + 100, battlearea.top + 100) 
    end

    if self.selected > 0 then
        love.graphics.setColor(color["white"])
        love.graphics.setFont(font["impact"])
        
        local weaponName = ""
        if self.selected == 1 then weaponName = "SNIPER"
        elseif self.selected == 2 then weaponName = "ROCKET LAUNCHER"
        elseif self.selected == 3 then weaponName = "CANNON"
        elseif self.selected == 4 then weaponName = "SHOCK"
        elseif self.selected == 5 then weaponName = "AIR"
        elseif self.selected == 6 then weaponName = "EARTHQUAKE"
        elseif self.selected == 7 then weaponName = "RADAR"
        end
        
        love.graphics.print(weaponName, battlearea.left + 197, battlearea.top + 560)

        -- 绘制选中的武器边框
        love.graphics.setColor(color["obj_selected"])
        love.graphics.setLineWidth(2)
        love.graphics.rectangle("line", self._x + (self.selected - 1) * 40, self._y, 40, 40)
    end
end

function Weapons:update(dt)
	
	self.hover = false
	
	local x = love.mouse.getX()
	local y = love.mouse.getY()
	
	if x > self._x
		and x < self._x + self.width
		and y > self._y
		and y < self._y + self.height then
		self.hover = true
	end
end

function Weapons:mousepressed(x, y, button)
	
	if self.hover then
		self.selected = math.floor((x - self._x) / 40) + 1
		if(self.selected > 7) then
		    self.selected = 7
		end
		state.gselectedBlockhouse = nil
		if audio then
			love.audio.play(sound["click"])
		end
		return true
	end
	
	return false
end

function Weapons:unSelected()
	self.selected = -1
end
