extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.3).timeout
	$Burp.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
