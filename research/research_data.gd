class_name ResearchData extends Resource

@export var name:String = ""
@export var description:String = ""
@export var is_unlocked:bool = false
@export var cost:int = 0
@export var level:int = 0
##required technologies to unlocked
@export var require_techs:Array[RequiredResearch]
