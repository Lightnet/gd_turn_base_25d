extends Node2D

@onready var line_edit_name: LineEdit = $CanvasLayer/Control/CenterContainer/VBoxContainer/HBoxContainer/LineEdit_Name

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_btn_save_pressed() -> void:
	if not line_edit_name.text.is_empty():
		var player_data = PlayerData.new()
		player_data.name = line_edit_name.text
		
		var character1 = CharacterData.new()
		character1.name = line_edit_name.text
		player_data.members.append(character1)
		
		var character2 = CharacterData.new()
		character2.name ="test2"
		player_data.members.append(character2)
		
		#GameData.save_Player_Data(player_data)
		GameData.save_player_slot_data(player_data)
	pass

func _on_btn_load_pressed() -> void:
	
	var tmp_player = PlayerData.new()
	tmp_player.name = line_edit_name.text
	
	var player_data = GameData.load_player_slot_data(tmp_player)
	if player_data:
		print("load player_data:", player_data)
		#var player_data:PlayerData = GameData.load_Player_Data()
		#for member in player_data.members:
			#print(member)
			#print("Member Name:",member.name)
		#print(player_data)
		pass
	pass

func _on_btn_check_pressed() -> void:
	#print("Check Data Exist: ", GameData.check_player_data_exist())
	
	var game_slots =  GameData.get_player_slot_datas()
	print("game_slots: ", game_slots)
	
	pass
