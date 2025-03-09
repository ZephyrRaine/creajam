extends Node

var count = 0

func _ready() -> void:
	for c in get_children():
		c.visible = false
		
func capture():
	get_child(count).visible = true
	count+=1
