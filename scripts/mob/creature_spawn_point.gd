extends Resource
class_name CreatureSpawnPoint

@export var id:String
@export var path:NodePath

func _init() -> void:
	id = Global.generate_random_id()
