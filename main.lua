function love.load() 
    -- 确保使用标准 Lua 的 require 而不是 love.filesystem.require
    -- love.filesystem.require = require 这行可以删除

    -- 下面这些常量定义可以保留，但注意它们可能已经有内置的等价物
    love.line_rough = "rough"
    love.line_smooth = "smooth"
    
    love.align_center = "center"
    love.align_left = "left"
    love.align_right = "right"

    love.draw_fill = "fill"
    love.draw_line = "line"
    
    -- ColorMode mode
    love.color_modulate = "modulate"
    love.color_replace = "replace"
    
    -- 新版 Love2D 已有 love.graphics.setColor 和 love.graphics.getColor，无需自定义 newColor 函数
    -- 可以考虑移除或重写这个函数，如果确实需要的话

    function love.audio.newMusic(file)
        return love.audio.newSource(file, "stream")  -- 指定类型为流式播放
    end

    function love.audio.newSound(file)
        return love.audio.newSource(file, "static")  -- 指定类型为静态声音
    end
    
    -- 使用标准 Lua 的 require 加载其他模块
    require("lua/button")
    require("lua/resources")
    require("lua/states")
    require("lua/menu")
    require("lua/game")
    
    -- Variables
    debug = true
    audio = true  -- whether audio should be on or off
    state = Menu.create()  -- current game state
    
    -- Setup
    -- love.graphics.setBackgroundColor(color["background"]) 如果 color 是预定义的表，则直接使用它
    if audio then
        local musicSource = music["menu"]
        love.audio.play(musicSource)
        --love.audio.setVolume(0.3);
    end

    -- Randomize
    math.randomseed(os.time())
end

function love.draw()
    state:draw()
end

function love.update(dt)
    -- 不推荐在 update 中使用 sleep，这会影响游戏性能和响应速度
    -- 如果要控制帧率，请考虑其他方法，例如调整 love.timer.sleep 的位置或完全避免使用它
    state:update(dt)
    -- love.timer.sleep(1) 建议移除
end

function love.mousepressed(x, y, button, istouch, presses)
    state:mousepressed(x, y, button, istouch, presses)
end

function love.keypressed(key, scancode, isrepeat)
    -- 注意：love.key_f4 应该直接使用字符串 "f4"，并且 love.keyboard.isDown 接受字符串参数
    if key == "f4" and (love.keyboard.isDown("ralt") or love.keyboard.isDown("lalt")) then
        love.event.quit()  -- 使用 quit 方法代替手动退出
    end
    state:keypressed(key, scancode, isrepeat)
end

-- 注意：以下部分代码是基于旧版Love2D的特性编写的，可能需要重新实现或移除以适应新版Love2D
-- delay 函数不推荐使用，因为它会影响游戏性能，建议通过调整 update 逻辑来控制帧率或其他需求