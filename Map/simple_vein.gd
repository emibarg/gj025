extends Node2D

@export var gravity :int = 300
@export var ID : int = 1

@export var move : bool = true

var nextLevel : int
signal loadNext(newLevel : int, id : int)

# Called when the node enters the scene tree for the first time.
func _ready():
	nextLevel = randi_range(0,1) # 0,1,2
	move = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if move:
		global_position = global_position - gravity * delta * Vector2.UP
	
	pass


func _on_load_next_body_entered(body):
	if body.is_in_group("Player"):
		loadNext.emit(nextLevel, ID)
		pass
	pass # Replace with function body.
