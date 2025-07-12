extends Node

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
var animation:Animation #current animation
var trigger_one:bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
	if animation_player:
		var anim_name = animation_player.get_current_animation()
		if anim_name == "attack":
			animation_attack_update()
	
	pass

func _on_animation_player_animation_changed(old_name: StringName, new_name: StringName) -> void:
	pass

func _on_animation_player_current_animation_changed(name: String) -> void:
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("finish anim_name:", anim_name)
	pass

func _on_animation_player_animation_started(anim_name: StringName) -> void:
	pass
	
func attack():
	animation = animation_player.get_animation("attack")
	animation_player.play("attack")
	trigger_one=false
	pass

func animation_attack_update():
	#var anim_name = animation_player.get_current_animation()
	#print("anim_name: ", anim_name)
	var anim_time = animation_player.get_current_animation_position()
	#print("anim_time: ", anim_time)
	var attack_time = animation.get_marker_time("attack")
	#print("attack_time: ", attack_time)
	if trigger_one == false and anim_time >= attack_time:
		print("attack")
		trigger_one=true
		pass
	pass
