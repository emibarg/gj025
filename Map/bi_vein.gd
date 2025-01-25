extends Node2D
@export var gravity :int = 300
@export var StopY :int = 3240
@export var ID : int = 1

var leftLevel : int
var rightLevel : int

var goFast : bool = true
@export var move : bool = true

signal loadLeft(newLeftLevel : int, id : int)
signal loadRight(newRightLevel : int, id : int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	leftLevel = randi_range(0,1) # 0,1,2
	rightLevel = randi_range(0,5) # 0,1,2,3,4,5
	move = false
	goFast = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if move:
		if goFast:
			global_position = global_position - gravity * delta * Vector2.UP
		else:
			global_position = global_position - gravity * delta * Vector2.UP * 0.4
	
	if global_position.y < StopY:
		goFast = true
	else:
		goFast = false
	


func _on_go_left_body_entered(body):
	if body.is_in_group("Player"):
		loadLeft.emit(leftLevel, ID)
		pass
	pass # Replace with function body.


func _on_go_right_body_entered(body):
	if body.is_in_group("Player"):
		loadRight.emit(rightLevel, ID)
	pass # Replace with function body.
