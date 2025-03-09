extends CanvasModulate

var base_color

func _ready() -> void:
	base_color = color

func _process(delta: float) -> void:
	if($"../Player".position.y > 180):
		color.v = 0.1
	else:
		color.v = 0.27
