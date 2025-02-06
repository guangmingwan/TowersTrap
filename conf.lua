function love.conf(t)
    t.identity = nil                   -- 存储保存数据等的目录名（nil使用默认值）
    t.version = "11.5"                 -- 所需的Love2D版本号
    t.console = false                  -- 是否在Windows下启用控制台窗口（仅用于调试）

    t.window.title = "Towers Strap"    -- 窗口标题
    t.window.icon = nil                -- 文件路径到窗口图标（无则为nil）
    t.window.width = 480               -- 窗口宽度
    t.window.height = 640              -- 窗口高度
    t.window.resizable = false         -- 窗口是否可调整大小
    t.window.minwidth = 1              -- 窗口最小宽度（如果不可调整大小，则忽略）
    t.window.minheight = 1             -- 窗口最小高度（如果不可调整大小，则忽略）
    t.window.fullscreen = false        -- 是否全屏
    t.window.fullscreentype = "desktop" -- 全屏类型 ("desktop" 或 "exclusive")
    t.window.vsync = true              -- 垂直同步 (true 或 false)
    t.window.msaa = 0                  -- 多重采样抗锯齿样本数 (通常为0, 2, 4, 8)

    t.modules.audio = true             -- 启用love.audio模块
    t.modules.event = true             -- 启用love.event模块
    t.modules.graphics = true          -- 启用love.graphics模块
    t.modules.image = true             -- 启用love.image模块
    t.modules.joystick = true          -- 启用love.joystick模块
    t.modules.keyboard = true          -- 启用love.keyboard模块
    t.modules.math = true              -- 启用love.math模块
    t.modules.mouse = true             -- 启用love.mouse模块
    t.modules.physics = true           -- 启用love.physics模块
    t.modules.sound = true             -- 启用love.sound模块
    t.modules.system = true            -- 启用love.system模块
    t.modules.timer = true             -- 启用love.timer模块
    t.modules.touch = true             -- 启用love.touch模块
    t.modules.video = true             -- 启用love.video模块
    t.modules.window = true            -- 启用love.window模块
end