extends Control

signal update_player_slots

const PLAYER_DATA_SETUP = preload("res://prefabs/dummy_player/player_data_setup.tres")

@onready var le_player_name: LineEdit = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/LE_PlayerName
@onready var cb_male: CheckBox = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/CBMale
@onready var cb_female: CheckBox = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/CBFemale
@onready var ui_player_slots: CenterContainer = $"../CenterContainer"
@onready var ui_create_player: Control = $"."

#func _ready() -> void:
	#pass

#func _process(delta: float) -> void:
	#pass

func _on_btn_cancel_pressed() -> void:
	ui_create_player.hide()
	ui_player_slots.show()
	pass

func _on_btn_create_character_pressed() -> void:
	print("le_player_name:", le_player_name.text)
	print("cb_male:", cb_male.button_pressed)
	print("cb_female:", cb_female.button_pressed)
	
	if not le_player_name.text.is_empty():
		var player_data = PlayerData.new()
		#var player_data = PLAYER_DATA_SETUP
		player_data.name = le_player_name.text
		
		if cb_male.button_pressed:
			player_data.gender = "male"
			
		if cb_female.button_pressed:
			player_data.gender = "female"
			
		var character1 = CharacterData.new()
		
		if cb_male.button_pressed:
			character1.gender = "male"
		if cb_female.button_pressed:
			character1.gender = "female"
			
		character1.name = le_player_name.text
		player_data.members.append(character1)
		
		#var resaerch_data:ResearchData = ResearchData.new()
		#resaerch_data.name = "test"
		#player_data.researches.append(resaerch_data)
		#
		#resaerch_data = ResearchData.new()
		#resaerch_data.name = "test2"
		#player_data.researches.append(resaerch_data)
		#player_data.researches = PLAYER_DATA_SETUP.researches
		
		for resaerch in PLAYER_DATA_SETUP.researches:
			var _resaerch:ResearchData = ResearchData.new()
			_resaerch.name = resaerch.name
			_resaerch.is_unlocked = resaerch.is_unlocked
			player_data.researches.append(_resaerch)
		
		#var character2 = CharacterData.new()
		#character2.name ="test2"
		#player_data.members.append(character2)
		
		GameData.save_player_slot_data(player_data)
	
	#update event
	update_player_slots.emit()
	ui_create_player.hide()
	ui_player_slots.show()
	pass

func _on_cb_male_toggled(toggled_on: bool) -> void:
	cb_female.button_pressed = false
	pass

func _on_cb_female_toggled(toggled_on: bool) -> void:
	cb_male.button_pressed = false
	pass

func _on_cb_male_pressed() -> void:
	cb_male.button_pressed = true
	cb_female.button_pressed = false
	pass

func _on_cb_female_pressed() -> void:
	cb_male.button_pressed = false
	cb_female.button_pressed = true
	pass
