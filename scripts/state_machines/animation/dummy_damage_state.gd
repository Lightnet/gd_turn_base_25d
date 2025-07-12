extends DummyPlayerState

@export var animation_name:String = "animtion_test/walk"

func handle_input(_event: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	if player.animation_player.is_playing() == false:
		#print("hurt finish...")
		finished.emit(IDLE)
		return
	pass

func enter(_previous_state_path: String, _data := {}) -> void:
	player.animation_player.play(animation_name)
	#print("enter hurt")
	pass

func exit() -> void:
	pass
