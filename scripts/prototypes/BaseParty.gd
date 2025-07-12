extends Control

@onready var game_single_player = $"../GameSinglePlayer"
@onready var party = $"."

func _on_btn_back_pressed():
	party.hide()
	game_single_player.show()
	pass 
