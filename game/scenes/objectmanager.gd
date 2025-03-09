extends Node2D

var cur_object
var unlocked_items : Array[String]

func _ready() -> void:
	for c in get_children():
		c.visible = false
	cur_object = null

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("use")):
		cur_object.use()
		
	if(Input.is_action_just_pressed("next_item")):
		set_next_item()
	
	if(Input.is_action_just_pressed("previous_item")):
		set_previous_item()

func set_previous_item():
	var i = unlocked_items.find(cur_object.name)
	if(i != -1):
		i -= 1
		if i < 0:
			i = unlocked_items.size()-1
		
		set_cur_item(unlocked_items[i])
	
func set_next_item():
	var i = unlocked_items.find(cur_object.name)
	if(i != -1):
		i += 1
		if i >= unlocked_items.size():
			i = 0
		
		set_cur_item(unlocked_items[i])

func set_cur_item(item: String):
	if(unlocked_items.has(item)):
		if(cur_object != null):
			cur_object.visible = false
		cur_object = find_child(item)
		cur_object.visible = true
			
	
func unlock_item(item : String):
	print(item)
	unlocked_items.append(item)
	if(cur_object == null):
		set_cur_item(item)
	
