extends Node2D

@export var startingSpeed : float = 300
@export var finalSpeed : float = 900

@export var move : bool = true
var goFast : bool = false
var counter : int = 0

signal heartCompleted()

# Called when the node enters the scene tree for the first time.
func _ready():
	move = false
	# move = true
	
	goFast = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if move:
		if goFast:
			global_position = global_position - finalSpeed * delta * Vector2.UP
		else:
			global_position = global_position - startingSpeed * delta * Vector2.UP
	
	pass

func changeColor():
	counter += 1
	$ColorAnimatino.start()
	
	var temp = $CaminoRecto.modulate
	var Rdiff : float = (temp.r - 1)/10
	var Gdiff : float = (temp.g - 0.68)/10
	var BDiff : float = (temp.b -0.63)/10
	var x = counter
	
	$CaminoRecto.modulate = Color(temp.r - Rdiff * x, temp.g - Gdiff * x, temp.b - BDiff * x);
	
	if x >= 10:
		$Latidos.play()
		$ColorAnimatino.queue_free()
		pass
	
	pass

func enableGodRay():
	$GodrayH.appear()
	pass

func _on_speed_up_zone_body_entered(body):
	if body.is_in_group("Player"):
		goFast = true
		$SpeedUpZone.global_position.y -= 1080 * 2
	pass # Replace with function body.


func _on_slow_down_zone_body_entered(body):
	if body.is_in_group("Player"):
		goFast = false
		$SlowDownZone.global_position.y -= 1080 * 2
	pass # Replace with function body.


func _on_end_zone_body_entered(body):
	if body.is_in_group("Player"):
		heartCompleted.emit()
	pass # Replace with function body.


func _on_color_animatino_timeout():
	changeColor()
	pass # Replace with function body.
