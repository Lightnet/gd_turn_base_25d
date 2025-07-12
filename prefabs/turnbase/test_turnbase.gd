extends Control

@onready var body_player = $"../../BodyPlayer"
@onready var body_player_2 = $"../../BodyPlayer2"

func _ready():
	body_player.connect("attack_finish",attack_finish)
	body_player_2.connect("attack_finish",attack_finish2)
	#pass

func attack_finish():
	print("done attack")
	body_player_2.anim_hurt()

func attack_finish2():
	print("done attack")
	body_player.anim_hurt()

#func _process(delta):
	#pass

func _on_btn_attack_01_pressed():
	body_player.anim_attack()
	#pass

func _on_btn_attack_02_pressed():
	body_player_2.anim_attack()
	#pass
