extends Node

#================================================
# FILE PATH BASE ON GODOT API
# user:// = user/AppData/Roaming/Godot/app_userdata/<Project Name>
#================================================
#var player_data_path = "user://playerdata01.tres"
#var inventory_data_path = "user://inventory_data01.tres"
#var inventory_datas_path = "user://inventory"
#var characters_datas_path = "user://characters/"
var player_data_slots_path = "user://player_slots/"

signal update_player_info(_player_data:PlayerData)
#================================================
# 
#================================================
#var player_data:PlayerData
#var characters:Array = []

#var party:Array[BattleCharacter] = []
#var enemies:Array = []
#var squad:Array = []
#var isPartyTurn:bool = true

func _ready():
	
	#var tmp_member = BattleCharacter.new()
	#tmp_member.Name = "Test"
	#tmp_member.Attack = 5
	#party.append(tmp_member)
	
	#tmp_member = BattleCharacter.new()
	#tmp_member.Name = "Mob"
	#enemies.append(tmp_member)
	
	check_name_folder("player_slots")
	
	#check_folders()
	#pass

#func check_player_data_exist():
	#if ResourceLoader.exists(player_data_path):
		#return true
	#return false
	#pass

# FOLDER CHECKS 
func check_folders():
	check_name_folder("characters")
	check_name_folder("inventory")
	check_name_folder("equips")
	check_name_folder("researchs")
	check_name_folder("homebase")
	check_name_folder("quests")
	
#check if dir exist else create dir
func check_name_folder(_name):
	var dir = DirAccess.open("user://")
	if dir.dir_exists(_name):
		#print("researchs exist")
		pass
	else:
		dir.make_dir(_name)
		#print("researchs create")
	pass

# not use been reworked
#func save_Player_Data(_player_data:PlayerData):
	#player_data = _player_data
	#update_player_info.emit(player_data)
	#ResourceSaver.save(player_data, player_data_path)
	#pass

# not use been reworked
#func load_Player_Data()->PlayerData:
	#print("LOAD DATA?")
	#if ResourceLoader.exists(player_data_path):
		#player_data = ResourceLoader.load(player_data_path)
		#print(player_data)
		#print("NAME: ",player_data.name)
		#update_player_info.emit(player_data)
		#return player_data
	#else:
		#return null
	#pass

## save player data to player_slots folder
#func save_Character_Data(_character_data:CharacterData):
	##var characterData = _character_data
	##update_player_info.emit(playerData)
	#ResourceSaver.save(_character_data, characters_datas_path+"/"+_character_data.Name+".tres")
	#pass

#func load_Characters_Data():
	##Character folder
	#var dir = DirAccess.open(characters_datas_path)
	##check folder exist
	#if dir:
		#print("LOAD CHARACTRERS")
		#dir.list_dir_begin()
		#var file_name = dir.get_next()
		##var count = 0
		#while file_name != "":
			#if dir.current_is_dir():
				##print("Found directory: " + file_name)
				#pass
			#else:
				#var res_data = ResourceLoader.load(characters_datas_path+file_name)
				#print("TREE RES Name: ", res_data.Name)
				#print("res_data Name: ", res_data.Name)
				#characters.append(res_data)
				#file_name = dir.get_next() #next loop
			##count += 1
	#pass

## get player_data slots files
func get_player_slot_datas():
	var dir = DirAccess.open(player_data_slots_path)
	var files = []
	
	if dir:
		dir.list_dir_begin() # Start listing the directory
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir(): # Only include files, not directories
				files.append(file_name)
			file_name = dir.get_next()
		dir.list_dir_end() # End listing
	else:
		print("Failed to open directory: ", player_data_slots_path)
		
	return files
	#pass

## save player_slot on player_slots folder with player name
func save_player_slot_data(_player_data:PlayerData):
	print("_player_data: ", _player_data)
	print("_player_data.name: ", _player_data.name)
	for resaerch in _player_data.researches:
		print("resaerch is_unlocked: " , resaerch.is_unlocked)
	
	var file_path = player_data_slots_path.path_join(_player_data.name + ".tres")
	
	ResourceSaver.save(_player_data,file_path,ResourceSaver.FLAG_RELATIVE_PATHS)
	#ResourceSaver.save(_player_data,file_path,ResourceSaver.FLAG_BUNDLE_RESOURCES)
	#ResourceSaver.save(_player_data,file_path,ResourceSaver.FLAG_RELATIVE_PATHS)
	#ResourceSaver.save(_player_data,file_path,ResourceSaver.FLAG_CHANGE_PATH)
	#ResourceSaver.save(_player_data,file_path,ResourceSaver.FLAG_SAVE_BIG_ENDIAN)
	
	pass

## load player_data on player_slots folder with player name, test
func load_player_slot_data(_player_data:PlayerData):
	#ResourceSaver.save(playerData, player_data_slots_path + "/" + _player_data.name + ".tres")
	var file_path = player_data_slots_path.path_join(_player_data.name + ".tres")
	if ResourceLoader.exists(file_path):
		var player_data = ResourceLoader.load(file_path)
		print(player_data)
		print("NAME: ",player_data.name)
		#update_player_info.emit(playerData)
		return player_data
		#pass
	else:
		return null
	#pass

## load player_data on player_slots folder with player name
func load_player_data_file(_name:String):
	var file_path = player_data_slots_path.path_join(_name)
	if ResourceLoader.exists(file_path):
		var player_data = ResourceLoader.load(file_path)
		print(player_data)
		print("NAME: ",player_data.name)
		#update_player_info.emit(playerData)
		return player_data
		#pass
	else:
		return null
	#pass

## delete player slot base on player name
func delete_player_data_file(_name:String)->bool:
	var file_path = player_data_slots_path.path_join(_name+ ".tres")
	var dir = DirAccess.open(player_data_slots_path)
	if dir.file_exists(_name+ ".tres"):
		var error = dir.remove(_name+ ".tres")
		if error == OK:
			print("File deleted successfully: ", file_path)
			return true
		else:
			print("Failed to delete file: ", file_path, " Error: ", error)
			return false
	else:
		print("File does not exist: ", file_path)
		return false
	
#func set_player_data(_player_data:PlayerData):
	#player_data = _player_data
	#pass
	
# 
