extends Marker2D

var player : SoftBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	##Find player and attach camera
	player = get_node("/root/Player/SoftBody2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
