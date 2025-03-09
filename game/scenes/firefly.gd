@tool
extends Node2D

@export var ref: NodePath # The EntityRef we are updating via post-import

var startPos : Vector2
var t : float

func _ready() -> void:
	if not Engine.is_editor_hint():
		t = randf()*100.0
		startPos = position
		print(startPos)
		$AnimatedSprite2D.speed_scale = randf() * 1.5 + 0.5


func _process(delta: float) -> void:
	if not Engine.is_editor_hint():
		t += delta
		position = startPos + (Vector2.UP * cos(t) * 5)	+ (Vector2.LEFT) * cos(t*0.5) * 8
		if($AnimatedSprite2D.frame == 1 || $AnimatedSprite2D.frame == 2):
			$PointLight2D.scale = Vector2.ONE * 0.21
		else:
			$PointLight2D.scale = Vector2.ONE * 0.2
		
