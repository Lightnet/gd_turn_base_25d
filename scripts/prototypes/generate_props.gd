extends Node3D

@export var time = 1

@export var count = 0
@export var count_max = 0

var rng = RandomNumberGenerator.new()
@export var rng_min = 0
@export var rng_max = 10

@export var prop:PackedScene

func _ready() -> void:
	count_max = rng.randf_range(rng_min, rng_max)
	#pass
	print("my_random_number: ",count_max)

func _process(delta: float) -> void:
	print("count_max:", count_max, "count: ", count )
	count += 1 * delta
	if count > count_max:
		count = 0
		count_max = rng.randf_range(rng_min, rng_max)
		var new_prop =  prop.instantiate()
		get_tree().current_scene.add_child(new_prop)
		new_prop.global_position = global_position
	#pass
