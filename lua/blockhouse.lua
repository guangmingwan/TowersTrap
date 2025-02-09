-----------------------
-- NO: A game of numbers
-- Created: 23.08.08 by Michael Enger
-- Version: 0.2
-- Website: http://www.facemeandscream.com
-- Licence: ZLIB
-----------------------
-- Handles buttons and such.
-----------------------

Blockhouse = {}
Blockhouse.__index = Blockhouse

function Blockhouse.create(weapon, mapgridpointer)
	lastselected = nil
	local temp = {}
	setmetatable(temp, Blockhouse)
	temp.hover = false -- whether the mouse is hovering over the button
	temp.hover_up = false
	temp.hover_down = false
	temp.click = false -- whether the mouse has been clicked on the button
	temp.weapon = weapon -- the text in the button
	temp.level = 1
	temp.fireangle = 0
	temp.sniffereangle = 0
	temp.buildangle = 0
	temp.ice = false
	temp.ice_time = 0
	temp.live = 1
	if(weapon == 1) then -- sniper
	    temp.gun = Sniper.create(temp)
 	elseif(weapon == 2) then -- rocket
	    temp.gun = Rocket.create(temp)
	elseif(weapon ==3) then --cannon
	    temp.gun = Cannon.create(temp)
	elseif(weapon ==4) then --shock
	    temp.gun = Shock.create(temp)
	elseif(weapon == 5) then -- air
		temp.gun = Air.create(temp)
	elseif(weapon == 6) then -- earthquake
	    temp.gun = EarthQuake.create(temp)
	elseif(weapon == 7) then -- radar
	    temp.gun = Radar.create(temp)
	end
	if(weapon == 5) then -- air
		temp.buildangle = 720
	else
		temp.angle = math.random(0, 360)
	end
	
	if(weapon == 6) then -- earthquacke
	    temp.earthquake_action_r = 6
	else
	    temp.earthquake_action_r = 0
	end
	
	temp.width = graphics["blockhous"][weapon]:getWidth()
	temp.height = graphics["blockhous"][weapon]:getHeight()
	temp._x = battlearea.left + (mapgridpointer.x) * 17
	temp._y = battlearea.top + (mapgridpointer.y) * 17
	temp.x = battlearea.left + (mapgridpointer.x + 1) * 17
	temp.y = battlearea.top + (mapgridpointer.y + 1) * 17
	temp.gridpointer = {}
	temp.gridpointer.x = mapgridpointer.x
	temp.gridpointer.y = mapgridpointer.y

	pr(temp.gun, "create blockhouse")
	return temp
end
local function drawWithDegrees(self,image, x, y, angleDegrees)
	-- 默认缩放比例设置为1，即不进行缩放
    local scaleX, scaleY = 1, 1
    -- 将角度从度转换为弧度
    local angleRadians = angleDegrees * (math.pi / 180)

    -- 计算图像中心点的偏移量
    local originX = self.width / 2
    local originY = self.height / 2

    -- 使用转换后的弧度值和中心点偏移进行绘制
    love.graphics.draw(image,  x+originX, y+originY, angleRadians, scaleX, scaleY, originX, originY)
end
function Blockhouse:draw()
	local i = self.weapon
	local gridpointer = self.gridpointer
	--self.angle = 0
	-- 假设 self.angle 是以度为单位的角度值
	love.graphics.setColor(1,1,1,1)
	drawWithDegrees(self,graphics["blockhous"][i], self._x, self._y,self.angle)
	if self.ice then
	    love.graphics.setColor(1, 1, 1, 200/255)
     	love.graphics.rectangle(love.draw_fill, self._x, self._y, 34, 34)
     	love.graphics.draw(graphics["bh_border_ice"], self._x, self._y)
	else
		love.graphics.setColor(1,1,1,1)
		love.graphics.draw(graphics["bh_border"], self._x, self._y)
	end

	if (self.weapon == 6) and self.earthquake_action_r > 0 then
		love.graphics.setColor(color["shadow"])
		love.graphics.circle(love.draw_fill, self.x, self.y, self.earthquake_action_r * 7, 255)
	end
	
	local s = ""
	local h = ""
	if(self.hover) then
		h = "hover"
	else
		h = "leave"
	end
	if(self.selected) then
		s = "selected"
	else
		s = "unsel"
	end

	-- 画碉堡信息 
	if self.hover and debug then
		love.graphics.setFont(font["tiny"])
 		love.graphics.setColor(color["text"])
		--love.graphics.draw(string.format("x=%d,y=%d,w=%d,h=%d,s=%s,m=%s",self._x,self._y,self.width,self.height,s,h),self._x,self._y)
		love.graphics.print(string.format("x=%d,y=%d,w=%d,h=%d,s=%s,m=%s",self._x,self._y,self.width,self.height,s,h),self._x,self._y)
	end
end

function Blockhouse:drawselector()

        local weapon = self.weapon
    	local level = self.level
		local range = tower_upgrade[weapon][level].range*7
		love.graphics.setColor(color["green_ol"])

		love.graphics.circle(love.draw_fill, self.x, self.y, range, 255)

		-- draw upgrade rectangle
		love.graphics.setLineWidth(1) -- 设置线条宽度为 1
		love.graphics.setLineStyle("smooth") -- 设置线条样式为平滑
		love.graphics.setColor(color["gray"])

		local textheight = font["tiny"]:getHeight()

		if(self.level < 5) then
			love.graphics.rectangle( love.draw_fill, self._x, self._y - 17, 17*2, 17)
			love.graphics.setColor(255/255,155/255,0)
			love.graphics.rectangle( love.draw_line, self._x + 1, self._y + 1 - 17, 17*2 - 2, 17 - 2)

			local buy_cost = tower_upgrade[self.weapon][self.level +1 ].buy_cost
			love.graphics.setColor(color["yellow"])
			love.graphics.setFont(font["tiny"])
			local textwidth = font["tiny"]:getWidth(buy_cost)
			--love.graphics.draw( buy_cost, self.x - textwidth /2, self._y - textheight / 2 )
			love.graphics.print( buy_cost, self.x - textwidth /2, self._y - textheight -5 )
		end

		local sell_cost = tower_upgrade[self.weapon][self.level].sell_cost
		love.graphics.setColor(1,85/255,32/255)
		love.graphics.rectangle( love.draw_fill, self._x, self.y + 17, 17*2, 17)
		love.graphics.setColor(color["yellow"])
		love.graphics.setFont(font["tiny"])
		local textwidth = font["tiny"]:getWidth(sell_cost)
		--love.graphics.draw( sell_cost, self.x - textwidth /2, self.y + 17 + 17 - textheight / 2 )
		love.graphics.print( sell_cost, self.x - textwidth /2, self.y + 17 + 12  - textheight )
end

function Blockhouse:update(dt)
	
	if(self.ice_time>0) then
	    self.ice_time = self.ice_time - dt
	else
	    self.ice = false
	end

	self.hover = false
	self.hover_up = false
	self.hover_down = false
	local x = love.mouse.getX()
	local y = love.mouse.getY()
	
	if x > self._x
		and x < self._x + self.width
		and y > self._y
		and y < self._y + self.height then
		self.hover = true
	elseif x > self._x
	    and x < self._x + self.width
	    and y > self._y - 17
	    and y < self._y - 2 then
	    self.hover_up = true
	elseif x > self._x
	    and x < self._x + self.width
	    and y > self.y + 17
	    and y < self.y + 17 * 2 then
	    self.hover_down = true
	end
	
	if(self.buildangle > 0 ) then
   		self.angle = self.buildangle - 3000* dt
   		self.buildangle = self.angle
   	elseif(self.fireangle > 0) then
   		self.angle = self.fireangle - 3000* dt
   		self.fireangle = self.angle
	elseif(self.sniffereangle>0 )then
     	self.angle = self.sniffereangle - self.angle + 90* dt
   		self.sniffereangle = self.angle
	end
	
   	if(self.ice) then
		return
	end

	if(self.earthquake_action_r > 0) then
	    self.earthquake_action_r = self.earthquake_action_r - 12* dt
	end

	if(self.gun ~=nil) then
		self.gun:update(dt)
	end
end

function Blockhouse:mousepressed(x, y, button)
 	local weapon = self.weapon
	local level = self.level
	if self.hover then
		if audio then
			love.audio.play(sound["click"])
		end
		state.gselectedBlockhouse = self
        state.weapons:unSelected()
	elseif state.gselectedBlockhouse == self and self.hover_up and level < 5 then --upgrade
		local buy_cost = tower_upgrade[weapon][level+1].buy_cost
		if state.money > buy_cost then
			self.level = self.level + 1
			state.money = state.money - buy_cost
		end
		return false
	elseif state.gselectedBlockhouse == self and self.hover_down then --sell
	    state.money = state.money + tower_upgrade[weapon][level].sell_cost
	    self.live = 0
	    state.gselectedBlockhouse = nil
     	return false
	end
	
	return true
end
