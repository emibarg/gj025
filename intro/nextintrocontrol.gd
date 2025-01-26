extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button2.hide()
	$BELIEVEME.play()
	await get_tree().create_timer(3).timeout
	$Button2.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
