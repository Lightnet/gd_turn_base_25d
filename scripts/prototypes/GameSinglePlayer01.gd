extends Control

@onready var l_name = $VBoxContainer2/HBoxContainer/LName
@onready var l_gender = $VBoxContainer2/HBoxContainer2/LGender

@onready var train_base = $"../TrainBase"
@onready var train_station = $"../TrainStation"
@onready var inventory = $"../Inventory"
@onready var game_single_player = $"."
@onready var upgrade = $"../Upgrade"
@onready var research = $"../Research"
@onready var battle_game = $"../BattleGame"
@onready var events = $"../Events"
@onready var shop = $"../Shop"
@onready var lottery = $"../Lottery"
@onready var craft = $"../Craft"
@onready var map = $"../Map"
@onready var party = $"../Party"
@onready var characters = $"../Characters"
@onready var rewards = $"../Rewards"


var player_data:PlayerData

func _ready():
	GameData.update_player_info.connect(UpdatePlayerData)
	pass
	
func _exit_tree():
	GameData.update_player_info.disconnect(UpdatePlayerData)
	pass

func UpdatePlayerData(_player_data:PlayerData):
	print("MY PLAYER DATA:??")
	player_data = _player_data
	l_name.text = player_data.Name
	l_gender.text = player_data.Gender
	pass

func _on_btn_play_pressed():
	game_single_player.hide()
	train_base.show()
	pass

func _on_btn_simulation_pressed():
	game_single_player.hide()
	train_base.show()
	pass

func _on_btn_research_pressed():
	game_single_player.hide()
	research.show()
	pass

func _on_btn_upgrade_pressed():
	game_single_player.hide()
	upgrade.show()
	pass

func _on_btn_train_pressed():
	game_single_player.hide()
	train_base.show()
	pass

func _on_btn_train_station_pressed():
	game_single_player.hide()
	train_station.show()
	pass

func _on_btn_battle_test_pressed():
	game_single_player.hide()
	battle_game.show()
	pass

func _on_btn_party_pressed():
	game_single_player.hide()
	party.show()
	pass

func _on_btn_craft_pressed():
	game_single_player.hide()
	craft.show()
	pass

func _on_btn_map_pressed():
	game_single_player.hide()
	map.show()
	pass

func _on_btn_lottery_pressed():
	game_single_player.hide()
	lottery.show()
	pass

func _on_btn_shop_pressed():
	game_single_player.hide()
	shop.show()
	pass

func _on_btn_inventory_pressed():
	game_single_player.hide()
	inventory.show()
	pass

func _on_btn_characters_pressed():
	game_single_player.hide()
	characters.setup_characters()
	characters.show()
	pass
