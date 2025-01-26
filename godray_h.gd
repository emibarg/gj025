extends Node2D

var fading : bool = false

var ogCutOff : float
var ogIntensity : float

# Called when the node enters the scene tree for the first time.
func _ready():
	ogCutOff = $GodrayH.material.get_shader_parameter("cutoff")
	ogIntensity = $GodrayH.material.get_shader_parameter("ray2_intensity")
	appear()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#if Input.is_action_just_pressed("move_left"):
		#fading = true
	#
	if fading:
		fade_out()
	pass

func fade_out():
	var materialG = $GodrayH.material
	var temp = materialG.get_shader_parameter("cutoff")
	materialG.set_shader_parameter("cutoff", temp + 0.01)
	temp = materialG.get_shader_parameter("ray2_intensity")
	materialG.set_shader_parameter("ray2_intensity", temp - 0.01)
	
	if materialG.get_shader_parameter("ray2_intensity") <= 0.001:
		queue_free()


func appear():
	fading = false
	var materialG = $GodrayH.material
	var temp = materialG.get_shader_parameter("cutoff")
	materialG.set_shader_parameter("cutoff", ogCutOff)
	temp = materialG.get_shader_parameter("ray2_intensity")
	materialG.set_shader_parameter("ray2_intensity", ogIntensity)
	pass
