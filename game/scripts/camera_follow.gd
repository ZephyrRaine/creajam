extends Camera2D

const utils = preload("res://scripts/utils.gd")


@export var character : CharacterBody2D 

var width = 320
var height = 180

func _process(delta: float) -> void:
	position = utils.getCenterWordlTile(character.position)
