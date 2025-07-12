extends MeshInstance3D

@onready var sub_viewport : SubViewport = $"../Sprite3D/Viewport2D"
@onready var mesh_instance : MeshInstance3D = $"."


func _ready() -> void:
	
	# Create a material and assign the ViewportTexture
	var material = StandardMaterial3D.new()
	material.albedo_texture = sub_viewport.get_texture()
	material.flags_unshaded = true  # Optional: Disable lighting
	mesh_instance.set_surface_override_material(0, material)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
