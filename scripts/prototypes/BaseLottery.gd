extends Control

@onready var lottery = $"."
@onready var game_single_player = $"../GameSinglePlayer"

func _on_btn_back_pressed():
	lottery.hide()
	game_single_player.show()
	pass
