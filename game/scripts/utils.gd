static var width = 320
static var height = 180

static func getWorldLevelTile(global:Vector2) -> Vector2i:
	var tileX = (int(global.x) / width)
	if(tileX == 0 && global.x < 0):
		tileX -= 1
	var tileY = (int(global.y) / height)
	if(tileY == 0 && global.y < 0):
		tileY -= 1		
	
	return Vector2i(tileX, tileY)
	
static func getCenterWordlTile(global:Vector2) -> Vector2:
	var position : Vector2
	var tilePos = getWorldLevelTile(global)
	position.x = tilePos.x*width + width * 0.5 
	position.y = tilePos.y*height + height * 0.5
	return position

static func getTileMap(levels:Array[Node], pos:Vector2) -> TileMapLayer:
	for level in levels:
		if (level.position.x < pos.x and level.position.y < pos.y and level.position.x + width > pos.x and level.position.y + height > pos.y):
			return level.find_child("GridColinFlo")
	return null
