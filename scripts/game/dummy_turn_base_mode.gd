extends Node

@onready var ui_battle_lost: Control = $"../CanvasLayer/UIBattleLost"
@onready var ui_battle_win: Control = $"../CanvasLayer/UIBattleWin"

# note that resuse does not reset the data it resued them. So use the _ready to resetup
var is_update_battle:bool = true
@onready var player_sprite_3d_1: DummyPlayer = $"../player_sprite3d1"
@onready var player_sprite_3d_2: DummyPlayer = $"../player_sprite3d2"

func _ready() -> void:
	print("BATTLE READY???")
	is_update_battle = true
	if player_sprite_3d_1:
		player_sprite_3d_1.is_controller = false
		player_sprite_3d_1.stats_data.health = 100
	if player_sprite_3d_2:
		player_sprite_3d_2.is_controller = false
		player_sprite_3d_2.stats_data.health = 100
	ui_battle_lost.hide()
	ui_battle_win.hide()
	#pass

func _process(delta: float) -> void:
	update_battle()
	#pass

# update condiction checks
func update_battle():
	if is_update_battle == false:
		return
	if player_sprite_3d_2:
		if player_sprite_3d_2.stats_data.health <= 0:
			is_update_battle = false
			Global.is_defeated = false
			print("finish battle?")
			Global.defeat_mob()
			ui_battle_win.show()
			#Global.game_controller.change_3d_scene("res://scenes/open_world_battle25d.tscn")
	if player_sprite_3d_1:
		if player_sprite_3d_1.stats_data.health <= 0:
			Global.is_defeated = true
			is_update_battle = false
			print("finish battle?")
			ui_battle_lost.show()
			#Global.game_controller.change_3d_scene("res://scenes/open_world_battle25d.tscn")

func _on_btn_win_end_battle_pressed() -> void:
	# open_world_scene_path
	Global.game_controller.change_3d_scene(Global.open_world_scene_path)
	#Global.game_controller.change_3d_scene("res://scenes/open_world_battle25d.tscn")
	#pass

func _on_btn_battle_lost_pressed() -> void:
	# need work...
	#Global.game_controller.change_gui_scene("res://scenes/ui/ui_main_menu.tscn")
	#Global.game_controller.change_3d_scene("res://scenes/dummy_blank_scene.tscn")
	#Global.game_controller.change_3d_scene("res://scenes/open_world_battle25d.tscn")
	Global.game_controller.change_3d_scene(Global.open_world_scene_path)
	#pass
