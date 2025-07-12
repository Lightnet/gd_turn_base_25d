extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var marker1 = animation_player.get_animation("test").get_marker_names() 
	print("marker1: ", marker1)
	
	print("marker test time: ", animation_player.get_animation("test").get_marker_time("test_mark"))
	
	
	var animation = $AnimationPlayer.get_animation("test")
	print("get_track_count:", animation.get_track_count() )
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var animation = $AnimationPlayer.get_animation("test")
	#print("get_track_count:", animation.get_track_count() )
	
	
	var animation:Animation = $AnimationPlayer.get_animation("test")
	#print("animation.step: ", animation.get_step())
	#print("animation.time: ", animation)
	
	
	#print("animation.time: ", $AnimationPlayer.current_animation_length)
	if $AnimationPlayer.get_current_animation():

		print("get_current_animation_position: ", $AnimationPlayer.get_current_animation_position())
	

	
	
	pass

func _on_btn_run_pressed() -> void:
	animation_player.play("test")
	pass

func _on_btn_stop_pressed() -> void:
	animation_player.stop()
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("finished: ", anim_name)
	var marker_position = get_animation_marker_position("test", "test_mark")
	print("marker_position: >> ", marker_position)
	pass


func get_animation_marker_position(animation_name, marker_name):
	var animation = $AnimationPlayer.get_animation(animation_name)
	if animation:
		#var markers = animation.get_marker_list()
		var markers = animation.get_marker_names()
		print("markers", markers)
		for marker in markers:
			if marker == marker_name:
				return animation.get_marker_time(marker)
	return -1
