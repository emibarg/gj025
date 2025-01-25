extends Node2D
@export var Vein : PackedScene
@export var BiVein : PackedScene

@export var slideSpeed : int = 100

var goLeft : bool = false
var goRight : bool = false
var startPos : float
var levelCount = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if goLeft:
		$Levels.global_position += Vector2.RIGHT * slideSpeed * delta
		if $Levels.global_position.x >= startPos + 640:
			goLeft = false
		pass
	
	
	
	pass


func _on_bi_vein_load_left(newLevel, IsSame):
	if IsSame:
		var bivein = BiVein.instantiate()
		bivein.global_position = Vector2(-640,-1080)
		$Levels.add_child(bivein)
		# FALTA conectar el nuevo child de vuelta a esta función
		startPos = $Levels.global_position.x
		goLeft = true
		pass
	
	
	
	
	pass # Replace with function body.
