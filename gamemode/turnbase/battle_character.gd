extends Resource
class_name BattleCharacter

@export var Name:String = "None"
@export var Health:float = 100
@export var MaxHealth:float = 100
@export var Attack:float = 1
@export var Defense:float = 1

@export var MaxActionPoint:float = 1
@export var ActionPoint:float = 1
@export var CurrentTurn:bool = false

@export var PartyID:int = 0
