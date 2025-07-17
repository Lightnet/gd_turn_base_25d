extends Control

@export var player1:Node3D
@export var player2:Node3D
@onready var label_state1: Label = $VBoxContainer/HBoxContainer/Label_State
@onready var label_state2: Label = $VBoxContainer2/HBoxContainer2/Label_State

func _ready():
	#player1.connect("attack_finish",attack_finish)
	#player2.connect("attack_finish",attack_finish2)
	pass
	
func _process(delta: float) -> void:
	label_state1.text = player1.state_machine.state.name 
	label_state2.text = player2.state_machine.state.name 
	pass

func attack_finish():
	#print("done attack")
	#player2.anim_hurt()
	pass
	
func attack_finish2():
	#print("done attack")
	#player1.anim_hurt()
	pass

#func _process(delta):
	#pass

func _on_btn_attack_01_pressed():
	#player1.anim_attack()
	player1.attack_target(player2)
	#pass

func _on_btn_attack_02_pressed():
	#player2.anim_attack()
	player2.attack_target(player1)
	pass
