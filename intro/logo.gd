extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://intro/intro1.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
