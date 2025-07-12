extends DummyPlayerState

var animation:Animation #current animation
var attack_time:float
var trigger_one:bool = false

#@export var target:Node3D
#@export var targets:Array[Node3D]
#@export var is_single_target:bool = true

@export var animation_name:String = "animtion_test/attack"
@export var marker_name:String = "attack"

#func handle_input(_event: InputEvent) -> void:
	#pass

func update(_delta: float) -> void:
	if animation:
		#print("current_animation: ",player.animation_player.current_animation)
		animation_attack_update()
		#print("player.animation_player.is_playing()",player.animation_player.is_playing())
		#if player.animation_player.is_playing() == false:
			#print("finish Idle")
			#finished.emit(IDLE)
		# check if the animation is finished
		if player.animation_player.is_playing() == false and trigger_one == true:
			print("finish Idle")
			finished.emit(IDLE)
	pass

func physics_update(_delta: float) -> void:
	pass

func enter(_previous_state_path: String, _data := {}) -> void:
	#print("animation attack...")
	animation = player.animation_player.get_animation(animation_name)
	attack_time = animation.get_marker_time(marker_name)
	player.animation_player.play(animation_name)
	trigger_one=false
	pass

func exit() -> void:
	animation=null
	pass

func animation_attack_update():
	#var anim_name = animation_player.get_current_animation()
	#print("anim_name: ", anim_name)
	var anim_time = player.animation_player.get_current_animation_position()
	#print("anim_time: ", anim_time)
	var attack_time = animation.get_marker_time(marker_name)
	#print("attack_time: ", attack_time)
	if trigger_one == false and anim_time >= attack_time:
		#print("attack")
		trigger_one=true
		if player.target:
			var hit_info = player.get_hit_info()
			player.target.hurt(hit_info)
		#pass
	#pass
