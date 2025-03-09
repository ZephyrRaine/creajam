extends AnimatedSprite2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent().name == "Player"):
		play("press")
		area.get_parent().on_trampoline = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if(area.get_parent().name == "Player"):
		play("release")
		area.get_parent().on_trampoline = false
