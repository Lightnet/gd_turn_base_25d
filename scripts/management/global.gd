extends Node

# battle scene
var next_scene:String = ""

# player scene when go to battle to save.
var open_world_scene_path:String = ""
var open_world_position:Vector3

# change the scene
var game_controller:GameController
# Length of the random ID
var id_length: int = 16

# Character set for generating the random ID (alphanumeric)
const CHARACTERS: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

# Generates a random ID string
func generate_random_id() -> String:
	var rng = RandomNumberGenerator.new()
	rng.randomize() # Ensure different random seed each run
	var result = ""
	for i in range(id_length):
		var index = rng.randi_range(0, CHARACTERS.length() - 1)
		result += CHARACTERS[index]
	return result

var current_mob_id:String
var mobs:Array[MapCreatureData]

func add_mob(_map_name,_id:String):
	current_mob_id = _id
	var mob_data = MapCreatureData.new()
	mob_data.name = _map_name
	mob_data.id = _id
	mobs.append(mob_data)
	pass

func defeat_mob():
	for mob in mobs:
		if mob.id == current_mob_id:
			mob.is_defeat = true
	pass
