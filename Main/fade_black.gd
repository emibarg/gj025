extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fadeIn():
	while color.a <= 0.99:
		color.a += 0.1
		await get_tree().create_timer(0.01).timeout
		pass
	pass

func fadeOut():
	while color.a >= 0:
		color.a -= 0.05
		await get_tree().create_timer(0.01).timeout
		pass
	pass
	pass
