extends RigidBody2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent().name == "Player"):
		$"anim".play("press")
		area.get_parent().on_trampoline = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if(area.get_parent().name == "Player"):
		$"anim".play("release")
		area.get_parent().on_trampoline = false

func _on_area_2d_2_area_entered(area: Area2D) -> void:
	if(area.get_parent().name == "Player"):
		$"anim".play("press")
		area.get_parent().on_trampoline = true


func _on_area_2d_2_area_exited(area: Area2D) -> void:
	if(area.get_parent().name == "Player"):
		$"anim".play("release")
		area.get_parent().on_trampoline = false
