extends Control

#func _ready() -> void:
	#pass

#func _process(delta: float) -> void:
	#pass

func _on_button_pressed() -> void:
	var players = get_tree().get_nodes_in_group("player")
	print("players: ", players)
	pass
