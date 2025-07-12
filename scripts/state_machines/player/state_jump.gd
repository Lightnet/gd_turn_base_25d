extends DummyPlayerState

@export var SPEED = 100.0
@export var JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func handle_input(event: InputEvent) -> void:
	
	pass

func update(_delta: float) -> void:
	
	pass

func physics_update(delta: float) -> void:
	# Add the gravity.
	if not player.is_on_floor():
		player.velocity.y -= gravity * delta
		
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
		finished.emit(IDLE)
	elif player.is_on_floor() and player.velocity.length() > 0:
		finished.emit(WALK)
	#pass

func enter(_previous_state_path: String, _data := {}) -> void:
	player.velocity.y = JUMP_VELOCITY
	pass

func exit() -> void:
	
	pass
#
