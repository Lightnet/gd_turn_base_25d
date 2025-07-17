extends Node3D

# note that wait for clean up since the player of moving scenes, add and delete

var players
var is_update:bool = false

func _ready() -> void:
	players = get_tree().get_nodes_in_group("player")
	print("WORLD PLAYERS: ",str(len(players)))
	update_player_position()


func _process(delta: float) -> void:
	players = get_tree().get_nodes_in_group("player")
	if len(players) == 1 and is_update == false:
		is_update = true
		update_player_position()
	pass

func update_player_position():
		#print("CHECK POSITION PLAYER>>>>>")
	players = get_tree().get_nodes_in_group("player")
	print(str(len(players)))
	#if defeated use defeat but need to use last save data or save point
	if Global.is_defeated == true:
		return
	#print("get_tree():", get_tree().get_current_scene().get_node("GameController/World3D"))
	#print("get_tree():", get_tree().get_current_scene().get_node("World3D").get_nodes_in_group("player")) #nope only get_tree > get_nodes_in_group
	#print("players: ", players)
	# player position
	var pos = Global.open_world_position
	#print("pos: ", pos)
	if pos.length() != 0:
		players = get_tree().get_nodes_in_group("player")
		#print("players: ", players)
		#for player in players:
			#print(player.get_path())
			#print(player)
			#print("visiable: ",player.visible)
			#pass
		
		if len(players) > 0:
			for player in players:
				player.global_position = pos
			players[0].global_position = pos
		pass
	pass
