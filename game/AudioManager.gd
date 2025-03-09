extends AudioStreamPlayer

var utils = preload("res://scripts/utils.gd")
@export var player : PlatformerController2D

var index = -1
var cur_clip_name

func _ready() -> void:
	(stream as AudioStreamInteractive).add_transition(AudioStreamInteractive.CLIP_ANY, AudioStreamInteractive.CLIP_ANY, AudioStreamInteractive.TRANSITION_FROM_TIME_IMMEDIATE, AudioStreamInteractive.TRANSITION_TO_TIME_START,AudioStreamInteractive.FADE_CROSS,20);

func getLevelIndex() -> int:
	var l = utils.getLevel($"../LDTKWorld".get_children(), $"../Player".transform.get_origin())
	var i = l.name.substr(l.name.length()-1, 1)
	return int(i)

func getAudioFromIndex(index: int):
	
	var clip_name;
	
	if(index >= 5):
		clip_name = "Spooky"
	elif(index >= 3):
		clip_name = "Alien 1"
	elif(index == 2):
		clip_name = "Calm 2"
	else : 
		clip_name = "Calm 1"
		
	if(clip_name != cur_clip_name):
		print(clip_name)
		cur_clip_name = clip_name
		get_stream_playback().switch_to_clip_by_name(cur_clip_name)
#		(stream as AudioStreamInteractive).set("parameters/switch_to_clip", clip_name)
	
func _process(delta: float) -> void:
	var i = getLevelIndex()
	if(index != i):
		index = i
		getAudioFromIndex(index)
	

#calm 1 : 0, 1
#calm 2 : 2
#spooky : 5, 6, 7
#alien : 3, 4
