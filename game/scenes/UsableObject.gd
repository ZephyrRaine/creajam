extends AnimatedSprite2D

func use():
	play("use")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(is_playing() and area.get_parent().is_in_group("firefly")):
		area.get_parent().queue_free()
		print("FIREFLY")
