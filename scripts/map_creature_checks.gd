extends Node3D

@export var map_creature_data:MapCreatureData

func _ready() -> void:
	if map_creature_data:
		for mob in map_creature_data.mobs:
			if mob:
				
				pass
		pass
	pass

func _process(delta: float) -> void:
	pass
