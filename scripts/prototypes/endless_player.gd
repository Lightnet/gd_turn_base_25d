extends CharacterBody3D

@export var SPEED = 5.0

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left","right","up","down")
	var direction = (transform.basis * Vector3(input_dir.x,0,input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
	
	var collision = get_last_slide_collision()
	if collision:
		#print("Collided with: ", collision.get_collider())
		var shape =  collision.get_collider()
		if shape.is_in_group("ground"):
			#print("found!")
			pass
		else:
			get_tree().quit()
		#get_tree().quit()
	#pass
