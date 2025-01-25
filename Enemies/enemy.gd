extends Node2D

var gravity :int = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	##Spawn on top of the screen
	$RigidBody2D.position.y = -100
	$RigidBody2D.position.x = randf_range(0, 800)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:

	##Apply gravity
	$RigidBody2D.position.y += gravity * delta
