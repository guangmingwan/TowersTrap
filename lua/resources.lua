-----------------------
-- NO: A game of numbers
-- Created: 23.08.08 by Michael Enger
-- Version: 0.2
-- Website: http://www.facemeandscream.com
-- Licence: ZLIB
-----------------------
-- Handles buttons and such.
-----------------------


-- Resources
color = {
        background = {0.9412, 0.9529, 0.9686},
        main = {0.2471, 0.7569, 0.9608},
        menu_bg = {0.5098, 0.5294, 0.4745, 0.5882},
        menu_border = {0.5333, 0.5608, 0.5255, 0.7843},
        text = {0.2980, 0.3020, 0.3059},
        menu_text = {0, 0, 0},
        obj_selected = {0.9961, 0.6039, 0},
        grid_hover = {1, 0.6078, 0},
        grid_open = {0.9725, 0.9725, 0.3922, 0.7843},
        grid_close = {0.8980, 0.4980, 0.8275, 0.7843},
        grid = {1, 1, 1, 0.3922},
        white = {1, 1, 1},
        yellow = {1, 1, 0},
        overlay = {1, 1, 1, 0.3922},
        green_ol = {0, 1, 0, 0.0980}, -- 注意这里的alpha值被调整为0到1之间
        shadow = {0, 0, 0, 0.1961},
        black = {0, 0, 0},
        green = {0, 1, 0},
        green1 = {0, 0.9020, 0.6275},
        blood = {0.9020, 0, 0.6275},
        gray = {0.5020, 0.5020, 0.5020}
    }


font = {
	--default = love.graphics.newFont(love.default_font, 24),
	default = love.graphics.newFont(24),
	impact = love.graphics.newFont("resources/impact.ttf", 32),
	impact_0 = love.graphics.newFont("resources/impact.ttf", 30),
	impact_1 = love.graphics.newFont("resources/impact.ttf", 14), 
	impact_2 = love.graphics.newFont("resources/impact.ttf", 12),
	large = love.graphics.newFont(32),
	huge = love.graphics.newFont(72),
	small = love.graphics.newFont(22),
	medium = love.graphics.newFont(14),
	intruduc = love.graphics.newFont(12),
	tiny = love.graphics.newFont(9)
}

graphics = {
	battle_bg = love.graphics.newImage("img/bg.png"),
	logo = love.graphics.newImage("img/current_logo.png"),
	weapons = love.graphics.newImage("img/weapons.png"),
	fmas = love.graphics.newImage("img/fmas.png"),
	set = love.graphics.newImage("img/set.png"),
	notset = love.graphics.newImage("img/notset.png"),
	bh_border = love.graphics.newImage("img/bh_border.png"),
	bh_border_ice = love.graphics.newImage("img/bh_border_ice.png"),
	rocket_fire = love.graphics.newImage("img/rocket_fire.png"),
	range_fire = love.graphics.newImage("img/range_fire.png"),
	sa12_fire = love.graphics.newImage("img/sa12.png"),
	canon_fire = love.graphics.newImage("img/canon_fire.png"),
	shock_fire = love.graphics.newImage("img/star.png"),
	star_circle = love.graphics.newImage("img/star_circle.png"),
	power = love.graphics.newImage("img/power.png"),
	update = love.graphics.newImage("img/update.png"),
	coast = love.graphics.newImage("img/coast.png"),
      
	creature = {
		love.graphics.newImage("img/creature0.png"),
		love.graphics.newImage("img/creature1.png"),
		love.graphics.newImage("img/creature2.png"),
		love.graphics.newImage("img/creature3.png"),
		love.graphics.newImage("img/creature4.png"),
		love.graphics.newImage("img/creature5.png"),
		love.graphics.newImage("img/creature6.png"),
		love.graphics.newImage("img/creature7.png")
	},
	blockhous = {
		love.graphics.newImage("img/sniper.png"),
		love.graphics.newImage("img/rocket.png"),
		love.graphics.newImage("img/cannon.png"),
		love.graphics.newImage("img/slowdown.png"),
		love.graphics.newImage("img/air_tower.png"),
		love.graphics.newImage("img/earthquake_tower.png"),
		love.graphics.newImage("img/radar.png")
	}
}

music = {
    menu = love.audio.newSource("sound/menu_bg.mod", "stream"),
    game = love.audio.newSource("sound/game_bg.mod", "stream") 
}

sound = {
    click = love.audio.newSource("sound/click.ogg", "static"),
    shush = love.audio.newSource("sound/shh.ogg", "static"),
    pling = love.audio.newSource("sound/pling.ogg", "static"),
    create_tower = love.audio.newSource("sound/create_tower.wav", "static"),
    sniper_fire = love.audio.newSource("sound/sniper_fire.wav", "static"),
    rocket_fire = love.audio.newSource("sound/rocket_fire.wav", "static"),
    earthquake_fire = love.audio.newSource("sound/earthquake_fire.wav", "static"),
    air_fire = love.audio.newSource("sound/air_fire.wav", "static"),
    radar_fire = love.audio.newSource("sound/radar_fire.wav", "static"),
    range_fire = love.audio.newSource("sound/range_fire.wav", "static"),
    slowdown_fire = love.audio.newSource("sound/slowdown_fire.wav", "static"),
    upgrade_tower = love.audio.newSource("sound/upgrade_tower.wav", "static"),
    sell_tower = love.audio.newSource("sound/sell_tower.wav", "static"),
    next_level = love.audio.newSource("sound/next_level.wav", "static"),
    creature_die = love.audio.newSource("sound/creature_die.wav", "static"),
    creature_rich_dest = love.audio.newSource("sound/creature_rich_dest.wav", "static")
}


tower_upgrade =
    { --snipper =
      {
-- ######## Line too long (120 chars) ######## :
        { buy_cost=10,sell_cost=8,damage=8,range=6,update_time=10,shoot_time=30,bullet_speed=6,on_shoot_bullet_count=1},
-- ######## Line too long (123 chars) ######## :
        { buy_cost=20,sell_cost=24,damage=20,range=8,update_time=20,shoot_time=30,bullet_speed=6,on_shoot_bullet_count=1 },
-- ######## Line too long (126 chars) ######## :
        { buy_cost=40,sell_cost=48, damage =50,range=10,update_time=40,shoot_time=30,bullet_speed=6,on_shoot_bullet_count=1 },
-- ######## Line too long (125 chars) ######## :
        { buy_cost=70,sell_cost=96,damage=150,range=12,update_time=80,shoot_time=30,bullet_speed=6,on_shoot_bullet_count=1 },
-- ######## Line too long (127 chars) ######## :
        { buy_cost=170,sell_cost=240,damage=300,range=16,update_time=160,shoot_time=30,bullet_speed=7,on_shoot_bullet_count=1 }
      },
       --rocket =
      {
-- ######## Line too long (124 chars) ######## :
        { buy_cost=20,sell_cost=14,damage=10,range=10,update_time=10,shoot_time=70,bullet_speed=10,on_shoot_bullet_count=1},
-- ######## Line too long (124 chars) ######## :
        { buy_cost=40,sell_cost=50,damage=30,range=12,update_time=20,shoot_time=70,bullet_speed=10,on_shoot_bullet_count=1},
-- ######## Line too long (125 chars) ######## :
        { buy_cost=80,sell_cost=100,damage=80,range=14,update_time=40,shoot_time=70,bullet_speed=10,on_shoot_bullet_count=1},
-- ######## Line too long (127 chars) ######## :
        { buy_cost=160,sell_cost=220,damage=200,range=16,update_time=80,shoot_time=70,bullet_speed=10,on_shoot_bullet_count=1},
-- ######## Line too long (127 chars) ######## :
        { buy_cost=320,sell_cost=400,damage=400,range=18,update_time=160,shoot_time=70,bullet_speed=10,on_shoot_bullet_count=1}
      },
       --cannon =
      {
-- ######## Line too long (122 chars) ######## :
        { buy_cost=100,sell_cost=80,damage=2,range=8,update_time=10,shoot_time=70,bullet_speed=8,on_shoot_bullet_count=1},
-- ######## Line too long (123 chars) ######## :
        { buy_cost=150,sell_cost=150,damage=4,range=8,update_time=20,shoot_time=70,bullet_speed=8,on_shoot_bullet_count=1},
-- ######## Line too long (124 chars) ######## :
        { buy_cost=200,sell_cost=300,damage=10,range=8,update_time=40,shoot_time=70,bullet_speed=8,on_shoot_bullet_count=1},
-- ######## Line too long (124 chars) ######## :
        { buy_cost=300,sell_cost=400,damage=25,range=8,update_time=80,shoot_time=70,bullet_speed=8,on_shoot_bullet_count=1},
-- ######## Line too long (126 chars) ######## :
        { buy_cost=400,sell_cost=600,damage=50,range=10,update_time=160,shoot_time=70,bullet_speed=12,on_shoot_bullet_count=1}
      },

       --shock =
      {
-- ######## Line too long (123 chars) ######## :
        { buy_cost=50,sell_cost=40,damage=10,range=6,update_time=10,shoot_time=60,bullet_speed=10,on_shoot_bullet_count=1},
-- ######## Line too long (125 chars) ######## :
        { buy_cost=100,sell_cost=120,damage=10,range=8,update_time=20,shoot_time=50,bullet_speed=10,on_shoot_bullet_count=1},
-- ######## Line too long (127 chars) ######## :
        { buy_cost=150,sell_cost=200,damage=20,range=10,update_time=40,shoot_time=40,bullet_speed=10,on_shoot_bullet_count=1},
-- ######## Line too long (127 chars) ######## :
        { buy_cost=150,sell_cost=300,damage=40,range=12,update_time=80,shoot_time=30,bullet_speed=10,on_shoot_bullet_count=1},
-- ######## Line too long (127 chars) ######## :
        { buy_cost=150,sell_cost=400,damage=80,range=14,update_time=160,shoot_time=10,bullet_speed=12,on_shoot_bullet_count=1}
      },
       --air =
      {
-- ######## Line too long (123 chars) ######## :
        { buy_cost=50,sell_cost=40,damage=20,range=10,update_time=10,shoot_time=20,bullet_speed=12,on_shoot_bullet_count=5},
-- ######## Line too long (125 chars) ######## :
        { buy_cost=100,sell_cost=120,damage=60,range=10,update_time=20,shoot_time=20,bullet_speed=12,on_shoot_bullet_count=7},
-- ######## Line too long (126 chars) ######## :
        { buy_cost=150,sell_cost=200,damage=180,range=10,update_time=40,shoot_time=20,bullet_speed=12,on_shoot_bullet_count=10},
-- ######## Line too long (126 chars) ######## :
        { buy_cost=200,sell_cost=350,damage=360,range=10,update_time=80,shoot_time=20,bullet_speed=12,on_shoot_bullet_count=12},
-- ######## Line too long (126 chars) ######## :
        { buy_cost=400,sell_cost=800,damage=700,range=12,update_time=160,shoot_time=20,bullet_speed=12,on_shoot_bullet_count=15}
      },
       --earthquake =
      {
-- ######## Line too long (123 chars) ######## :
        { buy_cost=100,sell_cost=80,damage=70,range=6,update_time=10,shoot_time=70,bullet_speed=1,on_shoot_bullet_count=1},
-- ######## Line too long (125 chars) ######## :
        { buy_cost=120,sell_cost=100,damage=140,range=6,update_time=20,shoot_time=70,bullet_speed=3,on_shoot_bullet_count=1},
-- ######## Line too long (125 chars) ######## :
        { buy_cost=240,sell_cost=130,damage=280,range=6,update_time=40,shoot_time=70,bullet_speed=3,on_shoot_bullet_count=1},
-- ######## Line too long (125 chars) ######## :
        { buy_cost=300,sell_cost=150,damage=560,range=6,update_time=80,shoot_time=70,bullet_speed=6,on_shoot_bullet_count=1},
-- ######## Line too long (126 chars) ######## :
        { buy_cost=400,sell_cost=150,damage=1120,range=6,update_time=160,shoot_time=70,bullet_speed=6,on_shoot_bullet_count=1}
      },
       --radar =
      {
-- ######## Line too long (121 chars) ######## :
        { buy_cost=50,sell_cost=40,damage=0,range=6,update_time=10,shoot_time=27,bullet_speed=0,on_shoot_bullet_count=0},
-- ######## Line too long (121 chars) ######## :
        { buy_cost=60,sell_cost=80,damage=0,range=8,update_time=20,shoot_time=27,bullet_speed=0,on_shoot_bullet_count=0},
-- ######## Line too long (125 chars) ######## :
        { buy_cost=70,sell_cost=160,damage=0, range =10,update_time=40,shoot_time=27,bullet_speed=0,on_shoot_bullet_count=0},
-- ######## Line too long (123 chars) ######## :
        { buy_cost=80,sell_cost=260,damage=0,range=12,update_time=80,shoot_time=27,bullet_speed=0,on_shoot_bullet_count=0},
-- ######## Line too long (124 chars) ######## :
        { buy_cost=100,sell_cost=260,damage=0,range=14,update_time=160,shoot_time=27,bullet_speed=0,on_shoot_bullet_count=0}
      }
    }
