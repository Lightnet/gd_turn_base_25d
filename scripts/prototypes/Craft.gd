extends Control

@onready var craft = $"."
@onready var game_single_player = $"../GameSinglePlayer"

func _on_btn_back_pressed():
	craft.hide()
	game_single_player.show()
	pass
