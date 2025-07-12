class_name RandomIDResource extends Resource
# test
@export var id: String = ""

# Character set for generating the random ID (alphanumeric)
const CHARACTERS: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

# Length of the random ID
@export var id_length: int = 16

# Called when the resource is created
func _init():
	if id.is_empty():
		id = Global.generate_random_id()

# Generates a random ID string
func generate_random_id() -> String:
	var rng = RandomNumberGenerator.new()
	rng.randomize() # Ensure different random seed each run
	var result = ""
	for i in range(id_length):
		var index = rng.randi_range(0, CHARACTERS.length() - 1)
		result += CHARACTERS[index]
	return result

# Optional: Regenerate ID on demand
func regenerate_id() -> void:
	id = generate_random_id()
