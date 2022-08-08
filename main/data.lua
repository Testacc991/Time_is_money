local M = {}
M.TILE_SIZE = 64
M.MAXWIDTH = 15
M.MAXHEIGHT = 11
M.CELLSIZE = 10

local level = 1
M.MAX_LEVELS = 4
M.LEVEL1TIME = 16
M.LEVEL2TIME = 35
M.LEVEL3TIME = 33
M.LEVEL4TIME = 45

M.LEVEL1COINS = 5
M.LEVEL2COINS = 5
M.LEVEL3COINS = 5
M.LEVEL4COINS = 5
function M.getlevel()
	return level
end
function M.addlevel()
	level = level+1
end
function M.setlevel(i)
	level = i
end
function M.world2tile(p)
	return vmath.vector3(math.floor((p.x + M.TILE_SIZE) / M.TILE_SIZE), math.floor((p.y + M.TILE_SIZE) / M.TILE_SIZE), p.z)
end

function M.tile2world(p)
	return vmath.vector3((p.x * M.TILE_SIZE) - (M.TILE_SIZE / 2), (p.y * M.TILE_SIZE) - (M.TILE_SIZE / 2), p.z)
end
function M.cantmoveobj(pos)
	if tilemap.get_tile("tilemaps#screen", "world", pos.x, pos.y) == 42 then
		return true
	end
	return false
end
function M.quit2menu()
	msg.post("main:/loader#loader", "show menu")
end
return M