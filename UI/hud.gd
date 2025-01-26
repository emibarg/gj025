extends CanvasLayer

signal start_game()

# Called when the node enters the scene tree for the first time.
func _ready():
	$HP1.texture = load("res://UI/vaccine full.png")
	$HP2.texture = load("res://UI/vaccine full.png")
	$HP3.texture = load("res://UI/vaccine full.png")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func changeHP(newHP : int):
	$TemporalHP.text = "HP: " + str(newHP)
	if newHP == 2:
		$HP3.texture = load("res://UI/vaccine empty.png")
	if newHP == 1:
		$HP2.texture = load("res://UI/vaccine empty.png")
	if newHP == 0:
		$HP1.texture = load("res://UI/vaccine empty.png")
	pass


func _on_soft_body_2d_hurt(newHP):
	changeHP(newHP)
	pass # Replace with function body.
