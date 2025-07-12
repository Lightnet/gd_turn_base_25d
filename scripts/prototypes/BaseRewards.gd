extends Control


@onready var game_single_player = $"../GameSinglePlayer"
@onready var rewards = $"."


func _on_btn_back_pressed():
	rewards.hide()
	game_single_player.show()
	pass
