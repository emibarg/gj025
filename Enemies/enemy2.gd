extends RigidBody2D


@export var gravity :int = 300

var targetVelocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	##Spawn on top of the screen
	position.y = -100
	position.x = randf_range(0, 800)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:

	##Apply gravity
	
	linear_velocity = linear_velocity - gravity * delta * Vector2.UP
