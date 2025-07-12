extends Control

@onready var game_single_player = $"../GameSinglePlayer"
@onready var create_player = $"../CreatePlayer"
@onready var menu = $"."
@onready var btn_play = $CenterContainer/VBoxContainer/btnPlay
@onready var btn_new_game = $CenterContainer/VBoxContainer/btnNewGame

@onready var train_base = $"../TrainBase"
@onready var train_station = $"../TrainStation"
@onready var battle_game = $"../BattleGame"
@onready var inventory = $"../Inventory"
@onready var events = $"../Events"
@onready var shop = $"../Shop"
@onready var lottery = $"../Lottery"
@onready var craft = $"../Craft"
@onready var map = $"../Map"
@onready var party = $"../Party"
@onready var characters = $"../Characters"
@onready var rewards = $"../Rewards"


func _ready():
	btn_play.hide()
	#btn_new_game.hide()
	check_user_exist()

func check_user_exist():
	setup()
	if GameData.check_player_data_exist():
		btn_play.show()
		pass
	else:
		#btn_new_game.show()
		pass
	pass
	

func setup():
	menu.show()
	game_single_player.hide()
	create_player.hide()
	train_base.hide()
	train_station.hide()
	battle_game.hide()
	events.hide()
	shop.hide()
	lottery.hide()
	craft.hide()
	map.hide()
	party.hide()
	characters.hide()
	rewards.hide()
	
	
	pass

func _on_btn_play_pressed():
	menu.hide()
	GameData.load_Player_Data()
	GameData.load_Characters_Data()
	game_single_player.show()
	pass # Replace with function body.

func _on_btn_new_game_pressed():
	menu.hide()
	create_player.show()
	pass # Replace with function body.

func _on_btn_settings_pressed():
	menu.hide()
	pass # Replace with function body.

func _on_btn_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
