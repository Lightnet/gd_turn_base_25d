extends MeshInstance3D

@export var SPEED:float = 5.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
	position.x -= SPEED * delta
	
	if position.x < -5:
		queue_free() 
	#pass
