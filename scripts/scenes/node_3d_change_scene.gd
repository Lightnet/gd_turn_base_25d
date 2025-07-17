extends Node3D

@export var id:String 
@export var enable = true

#@export var scene:PackedScene
@export var scene_name:String
@export var open_world:String

func _init() -> void:
	if id.is_empty():
		id = Global.generate_random_id()

func _ready() -> void:
	print("READY BATTLE????", enable)
	if enable == false:
		set_process_mode(Node.PROCESS_MODE_DISABLED)
		set_visible(false)
	pass

#func _process(delta: float) -> void:
	#pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	if not scene_name.is_empty() and body.is_in_group("player"):
		Global.next_scene = scene_name
		Global.save_player_data = Global.player_data
		Global.open_world_scene_path = open_world
		Global.open_world_position = body.global_position
		print("Global.open_world_position: ", Global.open_world_position)
		
		Global.add_mob(open_world, id)
		
		enable = false
		Global.game_controller.change_3d_scene(scene_name,true)
		
	#get_tree().change_scene_to_file("res://maps/battle_turn_base_mode_test.tscn")
	
	#if scene:
		#get_tree().change_scene_to_packed(scene)
		#get_tree().unload_current_scene()
		#get_tree().change_scene_to_file("res://maps/battle_turn_base_mode_test.tscn")
	pass
