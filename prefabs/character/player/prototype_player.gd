extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var player_sprite = $AnimatedSprite3D

var current_animation = "idle"
var is_press_move = false

func _ready():
	player_sprite.play("idle")
	#pass
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and Input.is_action_just_pressed("left"):
			current_animation = "walk"
			player_sprite.play("walk")
			player_sprite.flip_h = true
			is_press_move = true
			#print("walk???")
		if event.pressed and Input.is_action_just_pressed("right"):
			player_sprite.play("walk")
			current_animation = "walk"
			player_sprite.flip_h = false
			is_press_move = true
		else:
			is_press_move = false
			
		if event.is_released() and (is_press_move == false):
			player_sprite.play("idle")
			current_animation = "idle"
		#if event.pressed and event.keycode == KEY_ESCAPE:
			#get_tree().quit()
	#pass

func _process(delta):
	#print(current_animation)
	if current_animation == "walk":
		if player_sprite.is_playing():
			player_sprite.play("walk")
	#pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
