extends "res://scenes/UsableObject.gd"

var scene = preload("res://scenes/trampoline.tscn")
var instance = null

func use():
	var player = $"../../"
	if(player.is_on_floor()):
		if(instance != null):
			instance.queue_free()
		
		instance = scene.instantiate()
		
		instance.position = player.position + Vector2.RIGHT * 8 * $"../".scale.x;
		$"../../../".add_child(instance)
	
