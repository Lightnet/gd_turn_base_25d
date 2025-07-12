extends Node3D

var creature_points

func _ready() -> void:
	check_defeat_mobs()
	#pass

#func _process(delta: float) -> void:
	#pass

func check_defeat_mobs():
	creature_points = get_tree().get_nodes_in_group("mob")
	var mobs = Global.mobs
	for creature_point in creature_points:
		for mob in mobs:
			if creature_point.id == mob.id:
				creature_point.set_process_mode(Node.PROCESS_MODE_DISABLED)
				creature_point.visible = false
				pass
			pass
		pass
	pass
