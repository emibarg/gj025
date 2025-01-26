extends Node2D
@export var gravity :int = 300
@export var StopY :int = 3240
@export var ID : int = 1

var leftLevel : int
var rightLevel : int

var goFast : bool = true
var unload : bool = false
var HOTFIX : bool = true
@export var move : bool = true

signal loadLeft(newLeftLevel : int, id : int)
signal loadRight(newRightLevel : int, id : int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	leftLevel = randi_range(0,1) # 0,1
	var rightLevelRoll = randi_range(0,70) # 0,1,2,3,4, (0-30 = 0; 30-70 = 1; 70-80 = 2; 80-90 = 3; 90-100 = 4  )
	move = false
	# move = true
	goFast = false
	unload = false
	
	
	if rightLevelRoll <= 30:
		rightLevel = 0
	elif rightLevelRoll <= 70:
		rightLevel = 1
	elif rightLevelRoll <= 80:
		rightLevel = 2
		$GodrayH.visible = true
	elif rightLevelRoll <= 90:
		rightLevel = 4
		$Humo.visible = true
	else :
		rightLevel = 3
		$HumoStomach.visible = true
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if move:
		if goFast or unload:
			global_position = global_position - gravity * delta * Vector2.UP
		else:
			global_position = global_position - gravity * delta * Vector2.UP * 0.9
	
	if global_position.y < StopY:
		goFast = true
		unload = false
	else:
		goFast = false
	


func _on_go_left_body_entered(body):
	if body.is_in_group("Player"):
		loadLeft.emit(leftLevel, ID)
		unload = true
		pass
	pass # Replace with function body.


func _on_go_right_body_entered(body):
	if body.is_in_group("Player"):
		loadRight.emit(rightLevel, ID)
		unload = true
		
		if rightLevel == 2:
			HOTFIX = false
			$GodrayH.fading = true
		if rightLevel == 4:
			$Humo.fading = true
		if rightLevel == 3:
			$HumoStomach.fading = true
	pass # Replace with function body.


func _on_kill_zone_body_entered(body):
	if body.is_in_group("Player"):
		body.get_parent().die()
	pass # Replace with function body.

func rollNext():
	leftLevel = randi_range(0,1) # 0,1
	var rightLevelRoll = randi_range(0,100) # 0,1,2,3,4, (0-30 = 0; 30-70 = 1; 70-80 = 2; 80-90 = 3; 90-100 = 4  )
	
	if HOTFIX:
		$GodrayH.visible = false
	
	$Humo.visible = false
	$HumoStomach.visible = false
	
	if rightLevelRoll <= 30:
		rightLevel = 0
	elif rightLevelRoll <= 70:
		rightLevel = 1
	elif rightLevelRoll <= 80:
		rightLevel = 2
		$GodrayH.visible = true
	elif rightLevelRoll <= 90:
		rightLevel = 4
		$Humo.visible = true
	else :
		rightLevel = 3
		$HumoStomach.visible = true
	
	print("BiVein: ID = ", ID,"L LEVEL = ", leftLevel, " R LEVEL = ", rightLevel)
	
	pass
