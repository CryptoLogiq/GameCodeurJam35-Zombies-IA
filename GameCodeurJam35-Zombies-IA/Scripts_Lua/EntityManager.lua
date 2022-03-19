-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

Lst_Entity = {}

function entitypurgeList()
	Lst_Entity = {}
end

function getEntity(self, pID)
	-- Search if entity allready exist :
	for _, entity in ipairs(Lst_Entity) do
		if entity.ID == pID then
			self.entity = entity
			return entity
		end
	end
	return false
end

function newEntity(self, pID, pType) -- self == script self (not GameObject self)
	-- allready exist ?
	local entity = getEntity(self, pID)
	if entity then return entity end
	
	-- New entity :
	local entity = {ID=pID, type=pType, index=#Lst_Entity+1} -- identity
	-- controls
	entity.left = false
	entity.right = false
	entity.up = false
	entity.down = false
	entity.idle = false
	-- vars
	if pType == "player" then
		entity.sprBaseName = "#sprite"
	elseif pType == "zombies" then
		entity.sprBaseName = "#sprite_"
	elseif pType == "villageois" then
		entity.sprBaseName = "#sprite"
	end
	entity.sprBaseType = ""
	--
	table.insert(Lst_Entity, entity)
	--
	self.entity = entity
	return entity
	
end