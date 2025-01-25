extends Node2D

@export var slideSpeed : int = 200

var goLeft : bool = false
var goRight : bool = false
var goDown : bool = false
var nodeToMove
var startPos : float
var levelCount = 1

# 0 es una vein
# 1 es bivein
# 2 es trivein
# 3 es corazon
# 4 es estomago
# 5 es intestino

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var primerNivel : int = randi_range(0,1) # 0,1,2,
	
	primerNivel = 0
	
	if primerNivel == 0:
		$Levels/SimpleVein.global_position = Vector2(0,0)
		$Levels/SimpleVein.move = true
	if primerNivel == 1:
		$Levels/BiVein.global_position = Vector2(0,0)
		$Levels/BiVein.move = true
	
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if goLeft:
		$Levels.global_position += Vector2.RIGHT * slideSpeed * delta
		
		if $Levels.global_position.x >= startPos + 593:
			nodeToMove.global_position = Vector2(-30000, -1080)
			nodeToMove.move = false
			goLeft = false
		pass
	
	if goRight:
		$Levels.global_position += Vector2.LEFT * slideSpeed * delta
		
		if $Levels.global_position.x <= startPos - 780:
			nodeToMove.global_position = Vector2(-30000, -1080)
			nodeToMove.move = false
			goRight = false
	
	
	if goDown and nodeToMove.global_position.y >= startPos + 1400:
		nodeToMove.global_position = Vector2(-30000, -1000)
		nodeToMove.move = false
		goDown = false
		pass
	
	
	
	pass


func _on_bi_vein_load_left(newLeftLevel, id):
	var leftCorner = Vector2(-593, -1080)
	
	
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
	
	goRight = true
	startPos = $Levels.global_position.x
	pass # Replace with function body.

	pass # Replace with function body.


func _on_simple_vein_load_next(newLevel, id):
	var corner = Vector2(0,-1220)
	
	newLevel = 1
	
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
	
	goDown = true
	startPos = nodeToMove.global_position.y
	pass # Replace with function body.
