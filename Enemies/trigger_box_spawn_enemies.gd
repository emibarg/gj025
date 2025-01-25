extends Area2D

@export var maxEnemies : int = 3
@export var minEnemies : int = 1
@export var maxSpeed : int = 300
@export var minSpeed : int = 50
@export var maxScale : float = 1.5
@export var minScale : float = 0.5
@export var enemyScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn():
	
	var numberOfEnemies : int = randi_range(minEnemies, maxEnemies)
	print(numberOfEnemies)
	
	for i in range(numberOfEnemies):
		var enemy = enemyScene.instantiate()
		enemy.gravity = randi_range(minSpeed,maxSpeed)
		var scale = randf_range(minScale, maxScale)
		enemy.scale = Vector2(scale, scale)
		add_child(enemy)
		print(enemy.position)
		pass
	
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		call_deferred("spawn")
	pass # Replace with function body.
