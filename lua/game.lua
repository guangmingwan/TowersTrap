
-- Game State
-- Where the actual playing takes place

Game = {}
Game.__index = Game

grid_col = 28
grid_row = 32

--battlearea = {top = 0,left = 0}
battlearea = {
	left = 0 ,--(love.graphics.getWidth() - graphics["battle_bg"]:getWidth()) / 2,
	top = 0 --(love.graphics.getHeight() - graphics["battle_bg"]:getHeight()) / 2
}

size = 8

time_UpdateCapiton = 0

function Game.create()
	love.graphics.setBlendMode('alpha')
	music["game"]:setLooping(false)
	love.audio.play(music["game"])
	
	local temp = {}
	setmetatable(temp, Game)
	
	math.randomseed(os.time()) -- randomize (for good measure)
	
	--[[ 
	temp.x = 100
	temp.y = 0
	temp.width = love.graphics.getWidth( ) - 200
	temp.height = love.graphics.getHeight( )
	--]] 
	temp.x = 0--(love.graphics.getWidth() - graphics["battle_bg"]:getWidth()) / 2
	temp.y = 0--(love.graphics.getHeight() - graphics["battle_bg"]:getHeight()) / 2
	temp.width = love.graphics.getWidth() -- 200
	temp.height = love.graphics.getHeight()

	--[[
  	��ͼ��
	]]
	--temp.maps = {} -- ��ͼ
	temp.maps = {
				1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,1,1,1,1,
				1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,1,1,1,1,
				1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,1,1,1,1,
				1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,
				-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,
				-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,
				-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,
				-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,
				-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,
				-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,
				-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,
				-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
				1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,1,1,1,1,
				1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,1,1,1,1,
				1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,1,1,1,1,
				1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,1,1,1,1
			}

	for i = 0, grid_col * grid_row - 1 do
		if temp.maps[i+1] <= 0 then
		   	Map[i].iCanPass = true
	   	else
		   	Map[i].iCanPass = false
	   	end
	end
	
    temp.stages ={ --�ؿ����
				{ time = 20, creature = 0, number = 10 },
				{ time = 20, creature = 1, number = 20 }, 
				{ time = 20, creature = 2, number = 20 }, 
				{ time = 15, creature = 3, number = 15 }, 
				{ time = 15, creature = 4, number = 15 }, 
				{ time = 15, creature = 5, number = 15 },
				{ time = 15, creature = 7, number = 2 },
				{ time = 15, creature = 0, number = 15 }, 
				{ time = 15, creature = 1, number = 15 },
				{ time = 15, creature = 2, number = 15 },

				{ time = 15, creature = 3, number = 15 },
				{ time = 15, creature = 4, number = 15 },
				{ time = 15, creature = 5, number = 15 },
				{ time = 15, creature = 7, number = 2 },
				{ time = 15, creature = 0, number = 15 },
				{ time = 15, creature = 1, number = 15 },
				{ time = 15, creature = 3, number = 15 },
				{ time = 15, creature = 4, number = 15 },
				{ time = 15, creature = 5, number = 15 },
				{ time = 15, creature = 7, number = 2 },
				
				{ time = 15, creature = 1, number = 15 },
				{ time = 15, creature = 2, number = 15 },
				{ time = 15, creature = 3, number = 15 },
				{ time = 15, creature = 4, number = 15 },
				{ time = 15, creature = 5, number = 15 },
				{ time = 15, creature = 7, number = 2 },
				{ time = 15, creature = 0, number = 15 },
				{ time = 15, creature = 1, number = 15 },
				{ time = 15, creature = 3, number = 15 },
				{ time = 15, creature = 4, number = 15 },
				
				{ time = 15, creature = 5, number = 15 },
				{ time = 15, creature = 6, number = 15 },
				{ time = 15, creature = 7, number = 2 },
				{ time = 15, creature = 0, number = 15 },
				{ time = 15, creature = 2, number = 15 },
				{ time = 15, creature = 3, number = 15 },
				{ time = 15, creature = 4, number = 15 },
				{ time = 15, creature = 5, number = 15 },
				{ time = 15, creature = 6, number = 15 },
				{ time = 15, creature = 7, number = 2 },
				
				{ time = 15, creature = 0, number = 15 },
				{ time = 15, creature = 1, number = 15 },
				{ time = 15, creature = 2, number = 15 },
				{ time = 15, creature = 5, number = 15 },
				{ time = 15, creature = 4, number = 15 },
				{ time = 15, creature = 6, number = 15 },
				{ time = 15, creature = 7, number = 2 },
				{ time = 15, creature = 0, number = 15 },
				{ time = 15, creature = 1, number = 15 },
				{ time = 15, creature = 2, number = 15 },
				
				{ time = 15, creature = 3, number = 15 },
				{ time = 15, creature = 5, number = 15 },
				{ time = 15, creature = 6, number = 15 },
				{ time = 15, creature = 7, number = 2 },
				{ time = 15, creature = 0, number = 15 },
				{ time = 15, creature = 1, number = 15 },
				{ time = 15, creature = 2, number = 15 },
				{ time = 15, creature = 3, number = 15 },
				{ time = 15, creature = 4, number = 15 },
				{ time = 15, creature = 6, number = 15 },
				
				{ time = 15, creature = 7, number = 2 },
				{ time = 15, creature = 1, number = 15 },
				{ time = 15, creature = 2, number = 15 },
				{ time = 15, creature = 3, number = 15 },
				{ time = 15, creature = 4, number = 15 },
				{ time = 15, creature = 5, number = 15 },
				{ time = 15, creature = 6, number = 15 },
				{ time = 15, creature = 7, number = 2 },
				{ time = 15, creature = 0, number = 15 },
				{ time = 15, creature = 1, number = 15 },
				
				{ time = 15, creature = 2, number = 15 },
				{ time = 15, creature = 3, number = 15 },
				{ time = 15, creature = 4, number = 15 },
				{ time = 15, creature = 5, number = 15 },
				{ time = 15, creature = 6, number = 18 },
				{ time = 15, creature = 3, number = 14 },
				{ time = 15, creature = 0, number = 15 },
				{ time = 15, creature = 1, number = 16 },
				{ time = 15, creature = 2, number = 14 },
				{ time = 15, creature = 7, number = 2 }
				
				}
	
	temp.scope = 0 --����
	temp.money = 8000 --Ǯ
	temp.health = 50 --����
	temp.time = temp.stages[1].time --ʱ��
	temp.stage = 0 -- �ؿ�
	temp.blockhouses = {} -- �ﱤ
	temp.hints = {} --��ʾ
	temp.gselectedBlockhouse = nil;
	
	temp.enemys = {} --����
	temp.ballets = {} -- �ӵ� 
	-- ������λ��
	temp.mousepointer = {x = 0,
	                    y = 0}
	-- �������λ��					
	temp.gridpointer = {x = 0,
	                    y = 0}

	-- Setup the randomized grid
--	temp.grid = {}
--	for x = 1,size do
--		temp.grid[x] = {}
--		for y = 1, size do
--			num = math.random(1,3)
--			if num == 1 then
--				temp.grid[x][y] = false
--			else
--				temp.grid[x][y] = true
--			end
--		end
--	end
--	
	-- Create the text along the top
--	local count = 0
--	temp.horizontal = {}
--	for x = 1,size do
--		temp.horizontal[x] = ""
--		for y = 1,size do
--			if temp.grid[x][y] then
--				count = count + 1
--			elseif count ~= 0 then
--				temp.horizontal[x] = temp.horizontal[x] .. count .. "\n"
--				count = 0
--			end
--		end
--		
--		if count ~= 0 then
--			temp.horizontal[x] = temp.horizontal[x] .. count .. "\n"
--		end
--		
--		count = 0
--	end
--	
--	-- Create the text along the side
--	temp.vertical = {}
--	for y = 1,size do
--		temp.vertical[y] = ""
--		for x = 1,size do
--			if temp.grid[x][y] then
--				count = count + 1
--			elseif count ~= 0 then
--				temp.vertical[y] = temp.vertical[y] .. count .. " "
--				count = 0
--			end
--		end
--		
--		if count ~= 0 then
--			temp.vertical[y] = temp.vertical[y] .. count .. " "
--		end
--		
--		count = 0
--	end
--	
--	-- Setup the user-entered grid
--	temp.grid = {}
--	for x = 1,size do
--		temp.grid[x] = {}
--		for y = 1, size do
--			temp.grid[x][y] = 0
--		end
--	end
	
	-- Other variables
	--temp.time = 0 -- the time for this game
	temp.win = -999 -- if the game is won and timer for fadein
	temp.pause = false -- if the game is paused
	temp.button = {	new = Button.create("New Game", battlearea.left + 150, battlearea.top + 400),
					resume = Button.create("Resume", battlearea.left + 160, battlearea.top + 400),
					quit = Button.create("Quit", battlearea.left + 300, battlearea.top + 400) }
	temp.weapons = Weapons.create(battlearea.left + 335, battlearea.top + 617)
	return temp
end

function Game:getSelectWepons()
	return self.weapons:getSelected()
end

function Game:draw()
	--draw ����
	--love.graphics.draw(graphics["battle_bg"], 480/2, 640/2)
	--love.graphics.draw(graphics["battle_bg"], love.graphics.getWidth()/2, love.graphics.getHeight()/2)
	--print("self:x :"..self.x)
	--print("self.y :"..self.y)
	--love.timer.sleep(2000)
	--battlearea.left = self.x
	--battlearea.top = self.y
	love.graphics.setColor(1,1,1,1)
	love.graphics.draw(graphics["battle_bg"], battlearea.left, battlearea.top)
	
	-- 假设 time_UpdateCapiton 是一个全局变量或类成员变量，用于控制更新频率
	if time_UpdateCapiton <= 0 then
		-- 使用 love.window.setTitle 更新窗口标题以显示当前FPS
		love.window.setTitle("Towers Trap - [FPS: " .. tostring(love.timer.getFPS()) .. "]")
		
		-- 重置 time_UpdateCapiton 到期望的值，例如每秒更新一次
		-- 这里的 1.0 表示每秒更新一次，可以根据需要调整这个值
		time_UpdateCapiton = 1.0
	else
		-- 减去自上一帧以来的时间
		time_UpdateCapiton = time_UpdateCapiton - love.timer.getDelta()
	end

	if(debug) then	
		love.graphics.setFont(font["tiny"])
		love.graphics.setColor(color["text"])	
		--love.graphics.draw("mousepoint(x: " .. self.mousepointer.x .. ",y:" .. self.mousepointer.y,100, 180)
		love.graphics.print("mousepoint(x: " .. self.mousepointer.x .. ",y:" .. self.mousepointer.y..")", battlearea.left + 100, battlearea.top + 180)
		--love.graphics.draw(string.format("gridpoint(x:%d,y:%d-%d)",self.gridpointer.x,self.gridpointer.y,self.gridpointer.y * grid_col + self.gridpointer.x),100, 200)
		love.graphics.print(string.format("gridpoint(x:%d,y:%d-%d)",self.gridpointer.x,self.gridpointer.y,self.gridpointer.y * grid_col + self.gridpointer.x), battlearea.left + 100, battlearea.top + 200)
	
		-- draw grid
		love.graphics.setLineWidth(1) -- 设置线条宽度为 1
		love.graphics.setLineStyle("smooth") -- 设置线条样式为平滑
	    love.graphics.setLineStyle(love.line_smooth)
		
		-- unit grid = 17*17
	    for i = 0, grid_row - 1, 1 do	-- draw h line
	        love.graphics.setColor(color["grid"])
			love.graphics.line(battlearea.left, battlearea.top + i * 17, battlearea.left + grid_col * 17, battlearea.top + i * 17)
	        love.graphics.setColor(color["menu_text"])
			--love.graphics.draw(i, battlearea.left + 5, battlearea.top + i*17 + 10 )
			love.graphics.print(i, battlearea.left + 4, battlearea.top + i * 17 + 4)
	    end
	    for i = 0, grid_col - 1, 1 do -- draw v line
			love.graphics.setColor(color["grid"])
			love.graphics.line(battlearea.left + i * 17, battlearea.top, battlearea.left + i * 17, battlearea.top + 17 * grid_row)
	        love.graphics.setColor(color["menu_text"])
			--love.graphics.draw(i, battlearea.left + i*17 + 5, battlearea.top + 10)
			love.graphics.print(i, battlearea.left + i * 17 + 4, battlearea.top + 4)
	    end  
	end
	local selectWeapon = self:getSelectWepons()
	
	-- draw Ԥ�����÷���
	if (selectWeapon >=0) then
		local gx = self.gridpointer.x
		local gy = self.gridpointer.y
		local cx = battlearea.left + gx *17
		local cy = battlearea.top + gy * 17
		local i = self:getSelectWepons()
			
		love.graphics.setColor(color["grid_hover"])
		love.graphics.rectangle( love.draw_line, cx, cy , 17*2, 17*2) 
		
		-- ѡ���˵ﱤ����
		if i >0 then
			if self.money >= tower_upgrade[i][1].buy_cost and 
			(self.maps[grid_col*gy + gx+1] == 0) and
			(self.maps[grid_col*gy + gx +2] == 0) and
			(self.maps[grid_col*(gy+1) + gx +1] == 0) and
			(self.maps[grid_col*(gy+1) + gx+2] == 0) then
				love.graphics.setColor(color["grid_open"])
			else 
				love.graphics.setColor(color["grid_close"])
			end
			love.graphics.rectangle(love.draw_fill, cx + 1, cy + 1 , 17*2 -2, 17*2 -2)
			love.graphics.setColor(color["shadow"])
			local range = tower_upgrade[i][1].range;
			love.graphics.circle(love.draw_fill, cx + 17, cy + 17, range*7, 255)

   			-- ��ѡ�������������
			local damage  = tower_upgrade[i][1].damage
			local buy_cost = tower_upgrade[i][1].buy_cost
			local shoot_time = tower_upgrade[i][1].shoot_time

   			love.graphics.setColor(color["text"])
			love.graphics.setFont(font["tiny"])
			love.graphics.draw(graphics.power, battlearea.left + 74, battlearea.top + 570)
			--love.graphics.draw(damage,94,570)
			love.graphics.print(damage, battlearea.left + 94, battlearea.top + 570)
			love.graphics.draw(graphics.coast, battlearea.left + 120, battlearea.top + 570)
			--love.graphics.draw(buy_cost,144,570)
			love.graphics.print(buy_cost, battlearea.left + 144, battlearea.top + 570)
			love.graphics.draw(graphics.update, battlearea.left + 74, battlearea.top + 604)
			--love.graphics.draw(shoot_time,94,604)
			love.graphics.print(shoot_time, battlearea.left + 94, battlearea.top + 604)
		end
	end
	-- draw Time
	--print("battlearea.left:"..battlearea.left)
	--love.timer.sleep(2000)
	love.graphics.setColor(color["text"])
	love.graphics.setFont(font["medium"])
	--love.graphics.draw(string.format("%d", self.time), 135, 522)
	love.graphics.print(string.format("%d", self.time), battlearea.left + 135, battlearea.top + 522)
	-- draw health
	--love.graphics.draw(self.health, 350, 522)
	love.graphics.print(self.health, battlearea.left + 350, battlearea.top + 522)
	-- draw money
	--love.graphics.draw(self.money,115,50)
	love.graphics.print(self.money, battlearea.left + 115, battlearea.top + 50)
	-- draw scope
	--love.graphics.draw(self.scope,350,50)
	love.graphics.print(self.scope, battlearea.left + 350, battlearea.top + 50)
	-- draw stage level
    if(self.stage < #self.stages) then
		--love.graphics.draw(self.stage,26,576)
		love.graphics.print(self.stage, battlearea.left + 26, battlearea.top + 576)
		
		for i = 1,5 do
			local draw_stage = self.stage + i;
		   
			if(draw_stage > #self.stages) then
				break
			end
		    
			local creature_number = self.stages[draw_stage].creature + 1

			if draw_stage <= #self.stages then
				-- 获取当前颜色以便之后恢复
				local r, g, b, a = love.graphics.getColor()
				
				-- 设置半透明效果（通过alpha通道）
				local alpha = 255 - 150 * i / 5
				love.graphics.setColor(1, 1, 1, alpha/255)
				
				-- 设定混合模式为"alpha", 这是默认的混合模式，适用于大多数情况下的透明度处理
				--love.graphics.setBlendMode("alpha")
				
				-- 绘制生物图像
				love.graphics.draw(graphics["creature"][creature_number], battlearea.left + 14, battlearea.top + 566 - (i-1) * 30)
				
				-- 恢复之前保存的颜色
				love.graphics.setColor(r, g, b, a)
				
				-- 如果需要恢复到默认的混合模式或其他特定的混合模式，可以再次调用 setBlendMode
				--love.graphics.setBlendMode("alpha")  -- 或者选择其他合适的混合模式
			end
		end
	end
	-- draw weapons
	self.weapons:draw()

	for n,e in pairs(self.enemys) do
		e:draw()
	end
    for n,b in pairs(self.ballets) do
		b:draw()
	end
	
	for o,s in pairs(self.hints) do
		s:draw()
	end
	-- draw blockhouse
	for n,bh in pairs(self.blockhouses) do
		if (bh.live == 1) then
			bh:draw()
		end
	end
	
	-- ��ѡ�������������
	if(self.gselectedBlockhouse ~=nil) then
		local level = self.gselectedBlockhouse.level
	 	local index = self.gselectedBlockhouse.weapon
	 	local damage  = tower_upgrade[index][level].damage

	 	local damage_next = nil
	 	local shoot_time_next = nil
		if( level < 4) then
			damage_next = tower_upgrade[index][level+1].damage
			shoot_time_next = tower_upgrade[index][level+1].shoot_time
		end
		local buy_cost = tower_upgrade[index][level].buy_cost
		local shoot_time = tower_upgrade[index][level].shoot_time

		love.graphics.setColor(color["text"])
		love.graphics.setFont(font["tiny"])
		love.graphics.draw(graphics.power, battlearea.left + 74, battlearea.top + 570)
		--love.graphics.draw(damage,94,570)
		love.graphics.print(damage, battlearea.left + 94, battlearea.top + 570)

		love.graphics.draw(graphics.update, battlearea.left + 74, battlearea.top + 604)
		--love.graphics.draw(shoot_time,94,604)
		love.graphics.print(shoot_time, battlearea.left + 94, battlearea.top + 604)

		love.graphics.setColor(225/255,85/255,32/255)
		if(damage_next~=nil) then
			--love.graphics.draw(damage_next,144,570)
			love.graphics.print(damage_next, battlearea.left + 144, battlearea.top + 570)
		end
		if(shoot_time_next ~= nil) then
		    --love.graphics.draw(shoot_time_next,144,604)
			love.graphics.print(shoot_time_next, battlearea.left + 144, battlearea.top + 604)
		end
	end
	--��ѡ��ĵﱤ�߿�
	if self.gselectedBlockhouse ~= nil and self.gselectedBlockhouse.live == 1 then
     	self.gselectedBlockhouse:drawselector()
	end

	if self.win ~= -999 then
		-- You won!
		if self.win > 0 then
			love.graphics.setColor(1,1,1,(235-(100*(self.win/0.5))/255))
			love.graphics.rectangle(love.draw_fill, battlearea.left + 0, battlearea.top + 0, love.graphics.getWidth(), love.graphics.getHeight())
		else
			love.graphics.setColor(color["overlay"])
			love.graphics.rectangle(love.draw_fill, battlearea.left + 0, battlearea.top + 0, love.graphics.getWidth(), love.graphics.getHeight())
			love.graphics.setColor(color["main"])
			love.graphics.setFont(font["huge"])
			--love.graphics.drawf("CONGRATULATIONS", 0, 150, love.graphics.getWidth(), love.align_center)
			love.graphics.printf("CONGRATULATIONS", battlearea.left + 0, battlearea.top + 150, love.graphics.getWidth(), love.align_center)
			love.graphics.setColor(color["text"])
			love.graphics.setFont(font["default"])
			--love.graphics.drawf("You completed a level " .. self.stage .. " ,Scope is: \n" .. self.scope, 0, 200, love.graphics.getWidth(), love.align_center)
			love.graphics.printf("You completed a level " .. self.stage .. " ,Scope is: \n" .. self.scope, battlearea.left + 0, battlearea.top + 200, love.graphics.getWidth(), love.align_center)
			-- Buttons
			self.button["new"]:draw()
			self.button["quit"]:draw()
		end
	elseif self.pause then
		love.graphics.setColor(color["overlay"])
		love.graphics.rectangle(love.draw_fill, battlearea.left + 0, battlearea.top + 0,love.graphics.getWidth(),love.graphics.getHeight())
		love.graphics.setColor(color["main"])
		love.graphics.setFont(font["huge"])
		--love.graphics.drawf("PAUSED", 0, 150, love.graphics.getWidth(), love.align_center)
		love.graphics.printf("PAUSED", battlearea.left + 0, battlearea.top + 150, love.graphics.getWidth(), love.align_center)
		love.graphics.setColor(color["text"])
		love.graphics.setFont(font["default"])
		-- Buttons
		self.button["resume"]:draw()
		self.button["quit"]:draw()
	end
	
	if self.health <= 0 then
		love.graphics.setColor(color["overlay"])
		love.graphics.rectangle(love.draw_fill, battlearea.left + 0, battlearea.top + 0,love.graphics.getWidth(),love.graphics.getHeight())
		love.graphics.setColor(color["blood"])
		love.graphics.setFont(font["huge"])
		--love.graphics.drawf("YOU LOST", 0, 150, love.graphics.getWidth(), love.align_center)
		love.graphics.printf("YOU LOST", battlearea.left + 0, battlearea.top + 150, love.graphics.getWidth(), love.align_center)
		love.graphics.setColor(color["text"])
		love.graphics.setFont(font["default"])
		--love.graphics.drawf("You completed a level " .. self.stage .. "/80 ,Scope is: \n" .. self.scope, 0, 200, love.graphics.getWidth(), love.align_center)
		love.graphics.printf("You completed a level " .. self.stage .. "/80 ,Scope is: \n" .. self.scope, battlearea.left + 0, battlearea.top + 200, love.graphics.getWidth(), love.align_center)
		-- Buttons
		self.button["new"]:draw()
		self.button["quit"]:draw()
	end
end

function Game:update(dt)

	if(time_UpdateCapiton < 1) then
		time_UpdateCapiton = time_UpdateCapiton + dt
	else
	    time_UpdateCapiton = 0
	end
	if self.win == -999 and self.stage >= table.getn(self.stages) then
		self.win = 1
	end

	if self.win ~= -999 then
		if self.win > 0 then -- ʤ��
			self.win = self.win - dt
		end
		self.button["new"]:update(dt)
		self.button["quit"]:update(dt)
	elseif self.pause then -- ��ͣ
		self.button["resume"]:update(dt)
		self.button["quit"]:update(dt)
	elseif self.health <= 0 then
		self.button["new"]:update(dt)
		self.button["quit"]:update(dt)
	else -- ��Ϸ��
		local x = love.mouse.getX()
		local y = love.mouse.getY()
		self.mousepointer.x = x
		self.mousepointer.y = y
		local gx = math.floor((x - battlearea.left -17/2) / 17)
		local gy = math.floor((y - battlearea.top -17/2 ) / 17)
		
		if(gy <= 30) then
		self.gridpointer.x = gx
		self.gridpointer.y = gy
		end

		for n,bh in pairs(self.blockhouses) do
			if(bh.live == 0) then
				-- ���õ�ͼλ��Ϊ����ͨ��
				local gx = bh.gridpointer.x
				local gy = bh.gridpointer.y
				Map[grid_col*gy + gx ].iCanPass = true
				Map[grid_col*gy + gx + 1].iCanPass = true
				Map[grid_col*(gy+1) + gx ].iCanPass = true
				Map[grid_col*(gy+1) + gx + 1].iCanPass = true
				table.remove(self.blockhouses,n)

				self.maps[grid_col*gy + gx + 1] = 0
				self.maps[grid_col*gy + gx + 2] = 0
				self.maps[grid_col*(gy+1) + gx + 1] = 0
				self.maps[grid_col*(gy+1) + gx + 2] = 0
   			else
				bh:update(dt)
			end
		end

		for m,b in pairs(self.ballets) do
		
			if (b.live == 0) then -- ��ը
				local weapon = b.host.blockhouse.weapon
				local level = b.host.blockhouse.level
				--pr(b,"ballet")
				local damage = tower_upgrade[weapon][level].damage
				
				if(weapon == 1) then --sniper
					local e = b.target 
					if(math.abs(e.x - b.x) < 16 and math.abs(e.y - b.y) < 16) then
						e.health = e.health - damage
						if(e.health <=0) then
							b.host.target = nil
							love.audio.play(sound["creature_die"])
							self.scope = self.scope + e.award
							self.money = self.money + e.money
							table.insert(self.hints,Hint.create("fly",e.award,e.x,e.y))
						end
					end
				elseif (weapon == 2) then-- rocket
					for n,e in pairs(self.enemys) do
						if(e.number ~= 6 and math.abs(e.x - b.x) < 16 and math.abs(e.y - b.y) < 16) then
							e.health = e.health - damage
							if(e.health <=0) then
								b.host.target = nil
								love.audio.play(sound["creature_die"])
								self.scope = self.scope + e.award
								self.money = self.money + e.money
								table.insert(self.hints,Hint.create("fly",e.award,e.x,e.y))
							end
						end
					end
    			elseif(weapon == 3) then --range
					local e = b.target
					if(math.abs(e.x - b.x) < 16 and math.abs(e.y - b.y) < 16) then
						e.health = e.health - damage
						if(e.health <=0) then
							b.host.target = nil
							love.audio.play(sound["creature_die"])
							self.scope = self.scope + e.award
							self.money = self.money + e.money
							table.insert(self.hints,Hint.create("fly",e.award,e.x,e.y))
						end
					end
				elseif (weapon == 5) then -- air
				    local e = b.target
					if(e.number == 6 and math.abs(e.x - b.x) < 16 and math.abs(e.y - b.y) < 16) then
						e.health = e.health - damage
						if(e.health <=0) then
							b.host.target = nil
							love.audio.play(sound["creature_die"])
							self.scope = self.scope + e.award
							self.money = self.money + e.money
							table.insert(self.hints,Hint.create("fly",e.award,e.x,e.y))
						end
					end
				elseif (weapon == 6) then -- earthquake
					local rangle = 6*7
					for n,e in pairs(self.enemys) do
						if(e.number ~= 6 and math.abs(e.x - b.x) < rangle and math.abs(e.y - b.y) < rangle) then
							e.health = e.health - damage
							if(e.health <=0) then
								b.host.target = nil
								love.audio.play(sound["creature_die"])
								self.scope = self.scope + e.award
								self.money = self.money + e.money
								table.insert(self.hints,Hint.create("fly",e.award,e.x,e.y))
							end
						end
					end
				end  
				table.remove(self.ballets,m)
			else
				b:update(dt)
			end
		end

		self:switchStage(dt)
		
		self.weapons:update(dt)
		for n,e in pairs(self.enemys) do
			if(e.health <=0 ) then
				table.remove(self.enemys,n)
			elseif(e.pass) then
				self.health = self.health - 1
				table.remove(self.enemys,n)
			else
				e:update(dt)
			end
			
		end
		
		for o,s in pairs(self.hints) do
			if(s.delay >0) then
				s:update(dt)
			else
			    table.remove(self.hints,o)
			end
		end
	end
end

-- �л��ؿ�
function Game:switchStage(dt)

	--print("battlearea.left:"..battlearea.left)
	--love.timer.sleep(2000)
	if self.time <= 0 then
		self.stage = self.stage + 1
		self.time = self.stages[self.stage].time --ʱ��
		-- ���˽��볡��
		if(self.stage >= 1 and self.stage <= #self.stages) then
		
			for i = 1,self.stages[self.stage].number / 2 do
				local x = math.random(10,17)
				local y = math.random(0,3)
				--local creature =  Creature.create(self, self.stages[self.stage].creature, battlearea.left + x, battlearea.top + y, true)
				local creature =  Creature.create(self, self.stages[self.stage].creature, x, y, true)
    			table.insert(self.enemys, creature)
			
			end
			--[[ 
			for i = 1,self.stages[self.stage].number / 2 do
				local x = math.random(0,3)
				local y = math.random(12,20)
				--local creature =  Creature.create(self, self.stages[self.stage].creature, battlearea.left + x, battlearea.top + y, true)
				local creature =  Creature.create(self, self.stages[self.stage].creature, x, y, true)
				table.insert(self.enemys, creature)
			end
			--]]
			love.audio.stop() 
			love.audio.play(sound["next_level"])
		end
	end
	self.time = self.time - dt
end

function Game:IsBlocked(from)
	local isBlocked = true
	local startIndex, endIndex
	AStarInit()
	if(from == 1) then
		startIndex = 422
		endIndex = 426
	else
		startIndex = 68
		endIndex = 796
	end
	
	AStarPathFind(startIndex, endIndex)
	--AStarDrawPath(self.endIndex)

	local node = Map[endIndex]
	if(node.iParent) then
		isBlocked = false
	end

	return isBlocked
end

function Game:mousepressed(x, y, button)
	self.weapons:mousepressed(x, y, button)
	
    if(self.gselectedBlockhouse~=nil) then
        local i = self.gselectedBlockhouse:mousepressed(x, y, button)
        if(i == false) then
			return
		end
    end
	for n,bh in pairs(self.blockhouses) do
	    if(bh ~= self.gselectedBlockhouse) then
			local i = bh:mousepressed(x, y, button)
			if(i == false) then
				return
			end
		end
	end
	
	local x = love.mouse.getX()
	local y = love.mouse.getY()
	self.mousepointer.x = x
	self.mousepointer.y = y
	local gx = math.floor((x - battlearea.left - 17/2) / 17)
	local gy = math.floor((y - battlearea.top - 17/2 ) / 17)
	
	-- ��һ�� 
	if(x > 3 and x < 50 and y > 555 and y < 590) then
	    self.time = 0
		local bonus
		if self.stages[self.stage] then
			bonus = self.stages[self.stage].number
		else
			bonus = 15
		end
	    self.scope = self.scope + bonus
		table.insert(self.hints, Hint.create("fadeout2", "TIME BONUS!" .. bonus, 300, 550))
	end
	
	-- ��home�� 
	if(x > 3 and x < 50 and y > 600 and y < 634) then
		if self.win ~= -999 or self.health <= 0 then
			state = Menu.create()
		elseif self.pause then
			self.pause = false
		else
			self.pause = true
		end
	end 
	local i = self:getSelectWepons()
	if i >= 0 and self.money >= tower_upgrade[i][1].buy_cost and 
			(self.maps[grid_col * gy + gx + 1] == 0) and
			(self.maps[grid_col * gy + gx + 2] == 0) and
			(self.maps[grid_col * (gy + 1) + gx + 1] == 0) and
			(self.maps[grid_col * (gy + 1) + gx + 2] == 0) then
		
		-- ����һ���ﱤ
		Map[grid_col * gy + gx ].iCanPass = false
		Map[grid_col * gy + gx + 1].iCanPass = false
		Map[grid_col * (gy + 1) + gx ].iCanPass = false
		Map[grid_col * (gy + 1) + gx + 1].iCanPass = false
		
		self.maps[grid_col * gy + gx + 1] = 1
		self.maps[grid_col * gy + gx + 2] = 1
		self.maps[grid_col * (gy + 1) + gx + 1] = 1
		self.maps[grid_col * (gy + 1) + gx + 2] = 1
		
		if(self:IsBlocked(0) or self:IsBlocked(1)) then
			Map[grid_col * gy + gx ].iCanPass = true
			Map[grid_col * gy + gx + 1].iCanPass = true
			Map[grid_col * (gy + 1) + gx ].iCanPass = true
			Map[grid_col * (gy + 1) + gx + 1].iCanPass = true
			
			self.maps[grid_col * gy + gx + 1] = 0
			self.maps[grid_col * gy + gx + 2] = 0
			self.maps[grid_col * (gy + 1) + gx + 1] = 0
			self.maps[grid_col * (gy + 1) + gx + 2] = 0
			
			table.insert(self.hints, Hint.create("fadeout", "BLOCK!", 300, 550))
		else
			local blockhouse = Blockhouse.create(i, self.gridpointer)
	
			self.blockhouses[20 * gy + gx] = blockhouse
			
			-- ���õ�ͼλ��Ϊ������ͨ��
			love.audio.play(sound["create_tower"])
			self.money = self.money - tower_upgrade[i][1].buy_cost
		end
		--self.weapons:unSelected()
	end
	if self.win ~= -999 then
		if self.button["new"]:mousepressed(x, y, button) then
			state = Game.create()
		elseif self.button["quit"]:mousepressed(x, y, button) then
			state = Menu.create()
		end
	elseif self.pause then
		if self.button["resume"]:mousepressed(x, y, button) then
			self.pause = false
		elseif self.button["quit"]:mousepressed(x, y, button) then
			state = Menu.create()
		end
	elseif self.health <=0 then
		if self.button["new"]:mousepressed(x, y, button) then
			state = Game.create()
		elseif self.button["quit"]:mousepressed(x, y, button) then
			state = Menu.create()
		end
	end
end

function Game:keypressed(key)
	
	--if key == love.key_escape then
	if key == "escape" then
		if self.win ~= -999 or self.health <=0 then
			state = Menu.create()
		elseif self.pause then
			self.pause = false
		else
			self.pause = true
		end
	end
	if key == "f1" then
		self.weapons:unSelected()
	end
end