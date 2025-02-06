Menu = {}
Menu.__index = Menu

function Menu.create()
    local temp = {}
    setmetatable(temp, Menu)
    
    -- 确保按钮文本水平居中显示
    local buttonWidth = 200
    local buttonHeight = 50
    local buttonYStart = 200
    local verticalSpacing = 50
    
    temp.button = {
        new = Button.create("New Game", love.graphics.getWidth() / 2 - buttonWidth / 2, buttonYStart, buttonWidth, buttonHeight),
        instructions = Button.create("Instructions", love.graphics.getWidth() / 2 - buttonWidth / 2, buttonYStart + verticalSpacing, buttonWidth, buttonHeight),
        options = Button.create("Options", love.graphics.getWidth() / 2 - buttonWidth / 2, buttonYStart + 2 * verticalSpacing, buttonWidth, buttonHeight),
        quit = Button.create("Quit", love.graphics.getWidth() / 2 - buttonWidth / 2, buttonYStart + 6 * verticalSpacing, buttonWidth, buttonHeight) -- Adjusted spacing for the quit button
    }
    
    return temp
end

function Menu:draw()
    -- 绘制背景图片并调整大小适应窗口
    love.graphics.draw(graphics["logo"], 0, 0, 0, love.graphics.getWidth() / graphics["logo"]:getWidth(), love.graphics.getHeight() / graphics["logo"]:getHeight())
    
    -- 设置颜色并绘制菜单边框
    love.graphics.setColor(color["menu_border"])
    love.graphics.setLineWidth(4)
    love.graphics.rectangle("line", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    
    -- 设置颜色并绘制背景矩形
    love.graphics.setColor(color["menu_bg"])
    love.graphics.rectangle("fill", 2, 2, love.graphics.getWidth() - 4, love.graphics.getHeight() - 4)
    
    -- 绘制所有按钮
    for _, b in pairs(self.button) do
        b:draw()
    end
end

function Menu:update(dt)
    for _, b in pairs(self.button) do
        b:update(dt)
    end
end

function Menu:mousepressed(x, y, button)
    for n, b in pairs(self.button) do
        if b:mousepressed(x, y, button) then
            if n == "new" then
                love.audio.stop()
                state = Game.create()
            elseif n == "instructions" then
                state = Instructions.create()
            elseif n == "options" then
                state = Options.create()
            elseif n == "quit" then
                love.event.push("quit")
            end
        end
    end
end

function Menu:keypressed(key)
    -- 可根据需要添加键盘输入处理逻辑
end