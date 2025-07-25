class_name PlayerState extends State

const BATTLE = "Battle"
const ATTACK = "Attack"
const DAMAGE = "Damage"
const HURT = "Hurt"
const DEATH = "Death"

const IDLE = "Idle"
const RUNNING = "Running"
const JUMPING = "Jumping"
const FALLING = "Falling"

var player: Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
