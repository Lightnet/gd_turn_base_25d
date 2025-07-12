extends Control

@onready var game_single_player = $"../GameSinglePlayer"
@onready var research = $"."


func _on_btn_back_pressed():
	research.hide()
	game_single_player.show()
	pass
