extends Node2D

var cur_object

func _ready() -> void:
	cur_object = $Net

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("use")):
		cur_object.use()
