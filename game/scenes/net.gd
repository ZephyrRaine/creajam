extends "res://scenes/UsableObject.gd"

func use():
	if(!is_playing()):
		play("use")
		$Filet.play()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(is_playing() and area.get_parent().is_in_group("firefly")):
		$Luciole.play()
		area.get_parent().queue_free()
		$"../../../JAR_COLLECTION".capture()
