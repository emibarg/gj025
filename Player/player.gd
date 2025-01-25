extends Area2D

@export var speed = 300



# Called when the node enters the scene tree for the first time.
func _ready():
	#hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Define the direction to move
	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	# Change the position
	
	position += direction * speed * delta
	
	pass
