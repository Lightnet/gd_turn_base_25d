extends DummyPlayerState

@export var SPEED = 100.0

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("left") or event.is_action_pressed("right"):
		var _state:DummyPlayerState = player.animation_state.state
		_state.finished.emit(_state.WALK)
		pass
	if event.is_action_pressed("jump"):
		finished.emit(JUMP)
	#pass

func update(_delta: float) -> void:
	
	pass

func physics_update(delta: float) -> void:
	
	if Input.is_action_pressed("left"):
		player.set_is_right(false)
	if Input.is_action_pressed("right"):
		player.set_is_right(true)
		#pass
		
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#print("direction: ", direction)
	if direction:
		player.velocity.x = direction.x * SPEED * delta
		player.velocity.z = direction.z * SPEED * delta
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, SPEED * delta)
		player.velocity.z = move_toward(player.velocity.z, 0, SPEED * delta)
		
	player.move_and_slide()
	if player.velocity.length() == 0:
		#print("walk stop...")
		#var _state:DummyPlayerState = player.animation_state.state
		#_state.finished.emit(_state.IDLE)
		finished.emit(IDLE)
	#pass

func enter(_previous_state_path: String, _data := {}) -> void:
	
	pass

func exit() -> void:
	
	pass
#
#
