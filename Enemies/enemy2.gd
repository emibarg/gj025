extends RigidBody2D


@export var gravity :int = 300
@export var timeAlive : int = 10

var targetVelocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	##Spawn on top of the screen
	$LivingTime.wait_time = timeAlive
	global_position.y = -100
	global_position.x = randf_range(660, 1260)
	$LivingTime.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:

	##Apply gravity
	
	linear_velocity = linear_velocity - gravity * delta * Vector2.UP


func _on_living_time_timeout():
	queue_free()
	pass # Replace with function body.
