extends Control

@onready var events = $"."
@onready var game_single_player = $"../GameSinglePlayer"

func _on_btn_back_pressed():
	events.hide()
	game_single_player.show()
	pass
