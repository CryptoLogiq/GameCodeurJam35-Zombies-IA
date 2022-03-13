
-- Need require GameManager Lua scripts in any Game Objet need to globals vars :

-- ## Game ##

game = {waitingStart=true, start=false}

game.controls = {left=false,right=false,up=false,down=false,action=false,actionIsDown=false}
game.sticks = {}
game.sticks.left = vmath.vector3(0, 0, 0)
game.sticks.right = vmath.vector3(0, 0, 0)

function game.initControls()
	for k, v in pairs(game.controls) do
		k = false
	end
	game.sticks.left = vmath.vector3(0, 0, 0)
	game.sticks.right = vmath.vector3(0, 0, 0)
end

function game.getVector2()
	local ctrl = game.controls
	local x, y = 0, 0
	if ctrl.left and ctrl.right then
		x = 0
	elseif ctrl.left then 
		x = -1
	elseif ctrl.right	then
		x = 1
	else
		x = 0
	end
	--
	if ctrl.up and ctrl.down then
		y = 0
	elseif ctrl.up then
		y = 1
	elseif ctrl.down then
		y = -1
	else
		y = 0
	end
	--
	return x, y
end

function game.getVector2Normalise()
	local x, y = 0, 0
	--
	if game.sticks.left == vmath.vector3(0, 0, 0) then
		x, y = game.getVector2()
	else
		x, y = game.sticks.left.x, game.sticks.left.y
	end
	--
	local norm_x, norm_y = math.normalize(x,y)
	return norm_x, norm_y
end

-- ## Screen ##

screen = {}

screen.w, screen.h = window.get_size()
--
screen.x=0
screen.y=0
screen.cx = screen.w/2
screen.cy = screen.h/2


-- ## Timers ##

function newTimer(delay)
	local timer={c=0, d=delay, s=60}
	function timer:restart()
		self.c = 0
	end
	--
	function timer:update(dt)
		self.c = self.c + self.s * dt
		if self.c >= self.d then
			return true
		end
		return false
	end
	--
	return timer
end
--

-- ## General Entity ##
require "Scripts_Lua.EntityManager"

-- ## General Maths ##
require "Scripts_Lua.maths"