extends Parallax2D

@export var scroll_speed: Vector2 = Vector2(-50,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	motion_offset += scroll_speed * delta
