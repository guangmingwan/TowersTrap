-- Options State
-- Shows the options
Options = {}
Options.__index = Options

function Options.create()
	local temp = {}
	setmetatable(temp, Options)
	temp.button = {	on = Button.create("On", 240, 300),
					off = Button.create("Off", 300, 300),
					--five = Button.create(" 5 ", 375/2, 375),
					--six = Button.create(" 6 ", 425/2, 375),
					--seven = Button.create(" 7 ", 475/2, 375),
					--eight = Button.create(" 8 ", 525/2, 375),
					--nine = Button.create(" 9 ", 575, 375),
					back = Button.create("Back", 400/2, 550) }
	return temp
end

function Options:draw()
	love.graphics.setColor(1,1,1,1)
	-- 绘制背景图片并调整大小适应窗口
    love.graphics.draw(graphics["logo"], 0, 0, 0, love.graphics.getWidth() / graphics["logo"]:getWidth(), love.graphics.getHeight() / graphics["logo"]:getHeight())
   
	love.graphics.setColor(color["menu_border"])
	-- 设置线条宽度为 4
	love.graphics.setLineWidth(4)

	-- 设置线条样式为粗糙（"rough"），如果你想要平滑的线条，请使用 "smooth"
	love.graphics.setLineStyle("rough")
	love.graphics.rectangle( love.draw_line, 100, 0, love.graphics.getWidth( ) -200,  love.graphics.getHeight( ) ) 
	love.graphics.setColor(color["menu_bg"])
	love.graphics.setLineWidth(1) -- 设置线条宽度为 1
	love.graphics.setLineStyle("smooth") -- 设置线条样式为平滑
	love.graphics.rectangle( love.draw_fill, 102, 2, love.graphics.getWidth( ) -204,  love.graphics.getHeight( )-4 ) 

	
	love.graphics.setColor(color["text"])
	love.graphics.setFont(font["large"])
	--love.graphics.draw("Audio:", 60, 300)
	love.graphics.print("Audio:", 120, 300)
	--love.graphics.draw("Level:", 60, 375)
	
	love.graphics.setColor(color["main"])
	-- 设置线条宽度为 4
	love.graphics.setLineWidth(4)

	-- 设置线条样式为粗糙（"rough"），如果你想要平滑的线条，请使用 "smooth"
	love.graphics.setLineStyle("rough")
	
	if audio then
		love.graphics.line(400/2,305,450/2,305)
	else
		love.graphics.line(525/2,305,575/2,305)
	end
	
	--love.graphics.line((360+((size-5)*50))/2,380,(390+((size-5)*50))/2,380)
	
	for n,b in pairs(self.button) do
		b:draw()
	end

end

function Options:update(dt)
	
	for n,b in pairs(self.button) do
		b:update(dt)
	end
	
end

function Options:mousepressed(x,y,button)
	
	for n,b in pairs(self.button) do
		if b:mousepressed(x,y,button) then
			if n == "on" then
				audio = true
				love.audio.resume()
			elseif n == "off" then
				audio = false
				love.audio.pause()
			elseif n == "five" then
				size = 5
			elseif n == "six" then
				size = 6
			elseif n == "seven" then
				size = 7
			elseif n == "eight" then
				size = 8
			elseif n == "nine" then
				size = 9
			elseif n == "back" then
				state = Menu.create()
			end
		end
	end
	
end

function Options:keypressed(key)
	
	if key == love.key_escape then
		state = Menu.create()
	end
	
end