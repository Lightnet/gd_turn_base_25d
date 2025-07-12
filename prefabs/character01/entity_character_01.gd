extends Node2D

@export var com_health:Node
@export var com_attack:Node

@export var com_skills:Array
@onready var labelHealth = $Control/LHP

var isTurn:bool = false
var isUsed:bool = false
var cap_action_point:int = 1
var action_point:int = 1

func set_health(_health):
	labelHealth.text = str(_health)
	pass
