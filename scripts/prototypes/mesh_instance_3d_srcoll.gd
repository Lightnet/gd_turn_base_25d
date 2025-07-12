@tool
extends MeshInstance3D

@export var speed:float = 1

#func _ready() -> void:
	#pass

func _process(delta: float) -> void:
	get_surface_override_material(0).uv1_offset.z -= speed * delta
	#pass
