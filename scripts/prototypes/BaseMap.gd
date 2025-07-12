extends Control

@onready var map = $"."
@onready var game_single_player = $"../GameSinglePlayer"

func _on_btn_back_pressed():
	map.hide()
	game_single_player.show()
	pass
