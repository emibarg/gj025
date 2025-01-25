extends Node2D

@export var startingSpeed : float = 300
@export var finalSpeed : float = 900

@export var move : bool = true
var goFast : bool = false

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
