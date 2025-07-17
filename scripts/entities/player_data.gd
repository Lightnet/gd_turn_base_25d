extends Resource
# for saving player slot data
class_name PlayerData

@export var name:String = ""
@export var gender:String = "male"

#@export var stats_data:StatsData
#@export var health:float = 100
#@export var health_max:float = 100
#@export var level:int = 0
#@export var experince:int = 0
@export var tech_point:int = 0
@export var members:Array[CharacterData] = []
#@export var resaerch_tree:ResearchTree

@export var researches:Array[ResearchData] = []

## Map Data
## scene path
@export var open_world_path:String
## last player position
@export var open_world_pos:Vector3
## save point id in the map ???
@export var open_world_id:int
@export var open_world_save_point:String

func append_resaerch(_resaerch):
	var resaerch:ResearchData = _resaerch
	researches.append(resaerch)
	pass
