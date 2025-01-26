extends Node2D
var goaway : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	##wait two seconds before and leave the scene
	await get_tree().create_timer(3).timeout
	set("goaway", true)
	await get_tree().create_timer(1).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if goaway:
		##Move node diagonally to the top left
		global_position += Vector2(-1, -1) * 500 * delta
	
	pass # Replace with function body.
