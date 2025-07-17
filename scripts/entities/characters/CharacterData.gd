extends Resource
class_name CharacterData

@export var id:String = ""
@export var name:String = ""
@export var gender:String = ""
@export var description:String = ""
@export var scene:PackedScene # character

@export var stats:StatsData

func _init() -> void:
	stats = StatsData.new()
	
#@export var Level:int = 0
#
#@export var ExperincePoint:int = 0
#@export var MaxExperincePoint:int = 100
#
#@export var HealthPoint:int = 100
#@export var MaxHealthPoint:int = 100
#
#@export var MagicPoint:int = 100
#@export var MaxMagicPoint:int = 100
#
#@export var Attack:float = 1
#@export var Defense:float = 0
#
#@export var MagicAttack:float = 0
#@export var MagicDefense:float = 0
