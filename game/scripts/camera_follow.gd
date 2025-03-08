extends Camera2D


@export var character : CharacterBody2D 

var width = 320
var height = 180

func _process(delta: float) -> void:
	var tileX = (int(character.position.x) / width)
	position.x = tileX*width + width * 0.5 
	if(tileX == 0 && character.position.x < 0):
		tileX -= 1
	print(tileX)
	var tileY = (int(character.position.y) / height)
	if(tileY == 0 && character.position.y < 0):
		tileY -= 1
	position.y = tileY*height + height * 0.5
	print(tileY)
