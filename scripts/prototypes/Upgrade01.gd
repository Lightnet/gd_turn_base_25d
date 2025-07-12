extends Control

@onready var game_single_player = $"../GameSinglePlayer"
@onready var upgrade = $"."

func _on_btn_back_pressed():
	upgrade.hide()
	game_single_player.show()
	pass
