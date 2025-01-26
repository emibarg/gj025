extends Node2D

@export var slideSpeed : int = 200
@export var ParallaxBack : Node2D

var goLeft : bool = false
var goRight : bool = false
var goDown : bool = false
var nodeToMove
var extraRoad
var startPos : float
var levelCount = 1
var heartEnd : bool = false
var intestineEnd : bool = false
var stomachEnd : bool = false
var startLevel : bool = false

signal gameWon()

# 0 es una vein
# 1 es bivein
# 2 es corazon
# 3 es estomago
# 4 es intestino

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GameOver.hide()
	var primerNivel : int = randi_range(0,1) # 0,1,
	extraRoad = $Levels.get_node("ExtraVein")
	
	primerNivel = 1
	
	if primerNivel == 0:
		$Levels/SimpleVein.global_position = Vector2(0,0)
		await get_tree().create_timer(3).timeout
		$Levels/SimpleVein.move = true
	if primerNivel == 1:
		$Levels/BiVein.global_position = Vector2(0,0)
		await get_tree().create_timer(3).timeout
		$Levels/BiVein.move = true
	
	set("startLevel", true)
	
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if goLeft:
		$Levels.global_position += Vector2.RIGHT * slideSpeed * delta
		extraRoad.dissolve()
		extraRoad.move = true
		
		
		if $Levels.global_position.x >= startPos + 593:
			nodeToMove.global_position = Vector2(-30000, -1080)
			nodeToMove.move = false
			
			extraRoad.global_position = Vector2(-30000, -1080)
			extraRoad.restore()
			extraRoad.move = false
			
			goLeft = false
		pass
	
	if goRight:
		$Levels.global_position += Vector2.LEFT * slideSpeed * delta
		extraRoad.dissolve()
		extraRoad.move = true
		
		if $Levels.global_position.x <= startPos - 780:
			nodeToMove.global_position = Vector2(-30000, -1080)
			nodeToMove.move = false
			
			if heartEnd:
				$Levels/HeartVein.changeColor()
				$Levels/HeartVein.enableGodRay()
				pass
			
			if stomachEnd:
				$Levels/stomachVein.changeColor()
				$Levels/stomachVein.enableHumo()
			
			if intestineEnd:
				$Levels/intestineVein.changeColor()
				$Levels/intestineVein.enableHumo()
			
			
			extraRoad.global_position = Vector2(-30000, -1080)
			extraRoad.restore()
			extraRoad.move = false
			
			goRight = false
	
	
	if goDown and nodeToMove.global_position.y >= startPos + 1400:
		nodeToMove.global_position = Vector2(-30000, -1000)
		nodeToMove.move = false
		goDown = false
		pass
	
	
	
	pass


func _on_bi_vein_load_left(newLeftLevel, id):
	var leftCorner = Vector2(-593, -1080)
	var rightCorner = Vector2(780,-1080)
	
	extraRoad.global_position = rightCorner
	extraRoad.restaurar = true
	extraRoad.move = true
	
	if newLeftLevel == 0:
		$Levels/SimpleVein.global_position = leftCorner

		$Levels/SimpleVein.move = true
		if id == 1:
			nodeToMove = $Levels/BiVein
		if id == 2:
			nodeToMove = $Levels/BiVein2
	
	if newLeftLevel == 1:
		if id == 1:
			$Levels/BiVein2.global_position = leftCorner
			$Levels/BiVein2.move = true
			nodeToMove = $Levels/BiVein
		if id == 2:
			$Levels/BiVein.global_position = leftCorner
			$Levels/BiVein.move = true
			nodeToMove = $Levels/BiVein2
	
	goLeft = true
	startPos = $Levels.global_position.x
	pass # Replace with function body.


func _on_bi_vein_load_right(newRightLevel, id):
	var rightCorner = Vector2(780,-1080)
	var leftCorner = Vector2(-593, -1080)
	
	extraRoad.restaurar = true
	extraRoad.global_position = leftCorner
	extraRoad.move = true
	
	
	if newRightLevel == 0:
		$Levels/SimpleVein.global_position = rightCorner
		$Levels/SimpleVein.move = true
		if id == 1:
			nodeToMove = $Levels/BiVein
		if id == 2:
			nodeToMove = $Levels/BiVein2
	
	if newRightLevel == 1:
		if id == 1:
			$Levels/BiVein2.global_position = rightCorner
			$Levels/BiVein2.move = true
			nodeToMove = $Levels/BiVein
		if id == 2:
			$Levels/BiVein.global_position = rightCorner
			$Levels/BiVein.move = true
			nodeToMove = $Levels/BiVein2
	
	if newRightLevel == 2:
		$Levels/HeartVein.global_position = rightCorner
		$Levels/HeartVein.move = true
		
		heartEnd = true
		if id == 1:
			nodeToMove = $Levels/BiVein
		if id == 2:
			nodeToMove = $Levels/BiVein2
	
	if newRightLevel == 3:
		$Levels/stomachVein.global_position = rightCorner
		$Levels/stomachVein.move = true
		stomachEnd = true
		if id == 1:
			nodeToMove = $Levels/BiVein
		if id == 2:
			nodeToMove = $Levels/BiVein2
	
	
	if newRightLevel == 4:
		$Levels/intestineVein.global_position = rightCorner
		$Levels/intestineVein.move = true
		intestineEnd = true
		if id == 1:
			nodeToMove = $Levels/BiVein
		if id == 2:
			nodeToMove = $Levels/BiVein2
	
	
	
	goRight = true
	startPos = $Levels.global_position.x
	pass # Replace with function body.

	pass # Replace with function body.


func _on_simple_vein_load_next(newLevel, id):
	var corner = Vector2(0,-1220)
	
	
	if newLevel == 0:
		if id == 1:
			$Levels/SimpleVein2.global_position = corner
			$Levels/SimpleVein2.move = true
			nodeToMove = $Levels/SimpleVein
		if id == 2:
			$Levels/SimpleVein.global_position = corner
			$Levels/SimpleVein.move = true
			nodeToMove = $Levels/SimpleVein2
		pass
	
	if newLevel == 1:
		$Levels/BiVein.global_position = corner
		$Levels/BiVein.move = true
		if id == 1:
			nodeToMove = $Levels/SimpleVein
		if id == 2:
			nodeToMove = $Levels/SimpleVein2
		pass
	
	if startLevel:
		goDown = true
	startPos = nodeToMove.global_position.y
	pass # Replace with function body.


func _on_soft_body_2d_game_over():
	
	for level in $Levels.get_children():
		level.move = false
	
	ParallaxBack.get_node("ParallaxBackground").active = false
	$GameOver.show()
	
	pass # Replace with function body.


func _on_heart_vein_heart_completed():
	gameWon.emit()
	
	for level in $Levels.get_children():
		level.move = false
	ParallaxBack.get_node("ParallaxBackground").active = false
	
	$"SoftBody2D/Bone-11".linear_velocity = Vector2.UP * 90000
	$"SoftBody2D/Bone-10".linear_velocity = Vector2.UP * 90000
	$"SoftBody2D/Bone-12".linear_velocity = Vector2.UP * 90000
	
	pass # Replace with function body.


func _on_intestine_vein_intestine_completed():
	gameWon.emit()
	
	for level in $Levels.get_children():
		level.move = false
	ParallaxBack.get_node("ParallaxBackground").active = false
	
	$"SoftBody2D/Bone-11".linear_velocity = Vector2.UP * 90000
	$"SoftBody2D/Bone-10".linear_velocity = Vector2.UP * 90000
	$"SoftBody2D/Bone-12".linear_velocity = Vector2.UP * 90000
	pass # Replace with function body.


func _on_stomach_vein_stomach_completed():
	gameWon.emit()
	
	for level in $Levels.get_children():
		level.move = false
	ParallaxBack.get_node("ParallaxBackground").active = false
	
	$"SoftBody2D/Bone-11".linear_velocity = Vector2.UP * 90000
	$"SoftBody2D/Bone-10".linear_velocity = Vector2.UP * 90000
	$"SoftBody2D/Bone-12".linear_velocity = Vector2.UP * 90000
	pass # Replace with function body.
