extends Control

@onready var train_base = $"."
@onready var game_single_player = $"../GameSinglePlayer"

func _on_btn_back_pressed():
	train_base.hide()
	game_single_player.show()
	pass
