extends Node2D

@export var startingSpeed : float = 600
@export var acceleration : float = 0.1

@export var move : bool = true
var counter : int = 0

signal stomachCompleted()

# Called when the node enters the scene tree for the first time.
func _ready():
	move = false
	# move = true
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if move:
		global_position = global_position - startingSpeed * delta * Vector2.UP
	
	pass

func changeColor():
	counter += 1
	$ColorAnimation.start()
	
	var temp = $CaminoRecto.modulate
	var Rdiff : float = (temp.r - 0.99)/10
	var Gdiff : float = (temp.g - 1)/10
	var BDiff : float = (temp.b -0.49)/10
	var x = counter
	
	$CaminoRecto.modulate = Color(temp.r - Rdiff * x, temp.g - Gdiff * x, temp.b - BDiff * x);
	
	if x >= 10:
		$ColorAnimation.queue_free()
		pass
	
	pass

func enableHumo():
	$HumoStomach.appear()
	pass


func _on_color_animation_timeout():
	changeColor()
	pass # Replace with function body.


func _on_end_zone_body_entered(body):
	if body.is_in_group("Player"):
		stomachCompleted.emit()
	pass # Replace with function body.


func _on_go_fast_zone_body_entered(body):
	if body.is_in_group("Player"):
		startingSpeed = startingSpeed * (1 + acceleration)
		$GoFastZone.global_position.y -= 1080
	pass # Replace with function body.
