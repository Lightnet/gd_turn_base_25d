extends Node

@export var player_data:PlayerData

func _ready() -> void:
	Global.player_data = player_data
	#GameData.player_data = player_data
	pass

#func _process(delta: float) -> void:
	#pass
