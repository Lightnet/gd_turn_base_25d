extends Control

@onready var game_single_player = $"../GameSinglePlayer"
@onready var train_station = $"."

func _on_btn_back_pressed():
	train_station.hide()
	game_single_player.show()
	pass
