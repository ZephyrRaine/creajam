extends Sprite2D

@export var item_unlock : String;

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent().name == "Player"):
		area.get_parent().find_child("Objects").unlock_item(item_unlock)
		queue_free()
