extends Control

@onready var le_player_name = $CenterContainer/VBoxContainer/HBoxContainer/LE_PlayerName
@onready var cb_male = $CenterContainer/VBoxContainer/HBoxContainer2/CBMale
@onready var cb_female = $CenterContainer/VBoxContainer/HBoxContainer2/CBFemale
@onready var game_single_player = $"../GameSinglePlayer"
@onready var create_player = $"."

var gender:String = "male"

func _on_btn_create_character_pressed():
	var new_player = PlayerData.new()
	new_player.Name = le_player_name.text
	new_player.Gender = gender
	GameData.save_Player_Data(new_player)
	
	var new_character = CharacterData.new()
	
	new_character.Name = le_player_name.text
	new_character.Gender = gender
	print("new_character: ", new_character)
	
	GameData.save_Character_Data(new_character)
	
	
	create_player.hide()
	game_single_player.show()
	pass

func _on_cb_female_pressed():
	cb_male.button_pressed = false
	gender="female"
	pass

func _on_cb_male_pressed():
	cb_female.button_pressed = false
	gender="male"
	pass
