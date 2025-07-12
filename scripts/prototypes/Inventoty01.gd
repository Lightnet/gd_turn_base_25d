extends Control

@onready var inventory = $"."
@onready var game_single_player = $"../GameSinglePlayer"

func _on_btn_back_pressed():
	inventory.hide()
	game_single_player.show()
	pass
