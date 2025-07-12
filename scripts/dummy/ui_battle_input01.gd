extends Control

@export var player1: DummyPlayer
@export var player2: DummyPlayer

func _ready() -> void:
	
	if player1:
		print("player1")
		player1.target = player2
		
	if player2:
		print("player2")
		player2.target = player1
	#pass

#func _process(_delta: float) -> void:
	#pass

func _on_btn_attack_01_pressed() -> void:
	player1.attack()
	pass

func _on_btn_attack_02_pressed() -> void:
	player2.attack()
	pass
