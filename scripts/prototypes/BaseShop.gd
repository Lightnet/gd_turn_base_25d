extends Control

@onready var game_single_player = $"../GameSinglePlayer"
@onready var shop = $"."

func _on_btn_back_pressed():
	shop.hide()
	game_single_player.show()
	pass
