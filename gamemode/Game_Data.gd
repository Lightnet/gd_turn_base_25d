extends Node

var player_data_path = "user://playerdata01.tres"

var inventory_data_path = "user://inventory_data01.tres"
var inventory_datas_path = "user://inventory"

var characters_datas_path = "user://characters/"

signal update_player_info(_player_data:PlayerData)

var playerData:PlayerData
var characters:Array = []

var party:Array[BattleCharacter] = []
var enemies:Array = []
var squad:Array = []

var isPartyTurn:bool = true

func _ready():
	
	#var tmp_member = BattleCharacter.new()
	#tmp_member.Name = "Test"
	#tmp_member.Attack = 5
	#party.append(tmp_member)
	
	#tmp_member = BattleCharacter.new()
	#tmp_member.Name = "Mob"
	#enemies.append(tmp_member)
	
	check_folders()
	#pass

func check_player_data_exist():
	if ResourceLoader.exists(player_data_path):
		return true
	return false
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

func save_Player_Data(_player_data:PlayerData):
	playerData = _player_data
	update_player_info.emit(playerData)
	ResourceSaver.save(playerData, player_data_path)
	pass

func load_Player_Data():
	print("LOAD DATA?")
	if ResourceLoader.exists(player_data_path):
		playerData = ResourceLoader.load(player_data_path)
		print(playerData)
		print("NAME: ",playerData.Name)
		update_player_info.emit(playerData)
	pass
	
func save_Character_Data(_character_data:CharacterData):
	#var characterData = _character_data
	#update_player_info.emit(playerData)
	ResourceSaver.save(_character_data, characters_datas_path+"/"+_character_data.Name+".tres")
	pass

func load_Characters_Data():
	#Character folder
	var dir = DirAccess.open(characters_datas_path)
	#check folder exist
	if dir:
		print("LOAD CHARACTRERS")
		dir.list_dir_begin()
		var file_name = dir.get_next()
		#var count = 0
		while file_name != "":
			if dir.current_is_dir():
				#print("Found directory: " + file_name)
				pass
			else:
				var res_data = ResourceLoader.load(characters_datas_path+file_name)
				print("TREE RES Name: ", res_data.Name)
				print("res_data Name: ", res_data.Name)
				characters.append(res_data)
				file_name = dir.get_next() #next loop
			#count += 1
	pass
