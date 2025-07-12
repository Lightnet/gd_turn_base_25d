extends DummyPlayerState

func handle_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("left") or event.is_action_pressed("right") or event.is_action_pressed("up") or event.is_action_pressed("down") :
		finished.emit(WALK)
		pass
	if event.is_action_pressed("jump"):
		finished.emit(JUMP)
		pass
	#pass

func update(_delta: float) -> void:
	
	pass

func physics_update(_delta: float) -> void:
	
	pass

func enter(_previous_state_path: String, _data := {}) -> void:
	var _state:DummyPlayerState = player.animation_state.state
	_state.finished.emit(_state.IDLE)
	pass

func exit() -> void:
	
	pass
#
