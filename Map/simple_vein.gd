extends Node2D

@export var gravity :int = 300
@export var ID : int = 1

@export var move : bool = true

@export var disolver : bool = false
@export var restaurar : bool = false

var nextLevel : int
signal loadNext(newLevel : int, id : int)

# Called when the node enters the scene tree for the first time.
func _ready():
	nextLevel = randi_range(0,1) # 0,1,2
	disolver = true
	move = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	print(disolver)
	if disolver:
		
		dissolve()
	
	if restaurar:
		restore()
	
	if move:
		global_position = global_position - gravity * delta * Vector2.UP
	
	pass


func dissolve():
	var material = get_node("CaminoRecto").material
	if material and material is ShaderMaterial:
		var temp = material.get_shader_parameter("dissolve_value")
		material.set_shader_parameter("dissolve_value", temp - 0.0025)
		print("state: ", disolver)
		if temp == 0:
			disolver = false
	
	pass

func restore():
	var material = $CaminoRecto.material
	if material and material is ShaderMaterial:
		material.set_shader_parameter("dissolve_value", float(1))
	
	restaurar = false



func _on_load_next_body_entered(body):
	if body.is_in_group("Player"):
		loadNext.emit(nextLevel, ID)
		pass
	pass # Replace with function body.
