extends Node2D

@export var fallingSpeed : int = 900
@export var stopY : int = 6930

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.y < stopY:
		global_position = global_position - fallingSpeed * delta * Vector2.UP
	
	pass
