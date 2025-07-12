extends Node3D

@export var label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var random_str = generate_random_string(4) # Generates a 12-character string
	if label:
		label.text = random_str
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func generate_random_string(length: int = 16) -> String:
	const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	var random_string = ""
	var rng = RandomNumberGenerator.new()
	
	# Ensure length is not more than 16
	length = clamp(length, 1, 16)
	
	for i in range(length):
		random_string += charset[rng.randi_range(0, charset.length() - 1)]
	
	return random_string
