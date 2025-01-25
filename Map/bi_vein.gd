extends Node2D
@export var gravity :int = 300
@export var StopY :int = 3240
@export var possibleLevels : Array[PackedScene]

var leftLevel : PackedScene
var leftIsSame : bool = false
signal loadLeft(newLevel : PackedScene, IsSame)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var leftInt : int = randi_range(0,possibleLevels.size())
	var rightInt : int = randi_range(0,possibleLevels.size())
	
	leftInt = 0
	
	if leftInt == 0:
		leftIsSame = true
	else:
		leftLevel = possibleLevels[leftInt - 1]
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if global_position.y < StopY:
		global_position = global_position - gravity * delta * Vector2.UP


func _on_go_left_body_entered(body):
	if body.is_in_group("Player"):
		if leftIsSame:
			loadLeft.emit(null, leftIsSame)
		else:
			loadLeft.emit(leftLevel, leftIsSame)
		pass
	pass # Replace with function body.
