extends Node
##
# note that resuse does not reset the data it resued them. So use the _ready to resetup
var is_update_battle:bool = true
@onready var player_sprite_3d_1: DummyPlayer = $"../player_sprite3d1"
@onready var player_sprite_3d_2: DummyPlayer = $"../player_sprite3d2"
#@export var scene:PackedScene
# test 
#@export var is_play_condition:bool = false

func _ready() -> void:
	print("BATTLE READY???")
	is_update_battle = true
	if player_sprite_3d_2:
		player_sprite_3d_2.stats_data.health = 100
	pass

func _process(delta: float) -> void:
	update_battle()
	pass

# update condiction checks
func update_battle():
	if is_update_battle == false:
		return
	if player_sprite_3d_2:
		if player_sprite_3d_2.stats_data.health <= 0:
			is_update_battle = false
			#is_play_condition = true
			print("finish battle?")
			#get_tree().unload_current_scene()
			#var tree = get_tree()
			#var cur_scene = tree.get_current_scene()
			#tree.get_root().remove_child(cur_scene)
			#tree.change_scene_to_packed(scene)
			#get_tree().change_scene_to_file("res://maps/open_world_battle25d.tscn")
			#Global.next_scene = "res://maps/open_world_battle25d.tscn"
			
			Global.defeat_mob()
			Global.game_controller.change_3d_scene("res://scenes/open_world_battle25d.tscn")
			#if scene:
				#print("check scene")
				#get_tree().change_scene_to_packed(scene)
			#pass
	#pass
