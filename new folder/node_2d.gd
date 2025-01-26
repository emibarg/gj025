extends Node2D


@export var fading : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if fading:
		fade()
	
	pass

func fade():
	$GPUParticles2D.amount_ratio -= 0.04
	pass

func appear():
	$GPUParticles2D.amount_ratio = 1
	pass
