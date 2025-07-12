extends State
class_name DummyPlayerState 

const IDLE = "Idle"
const BATTLE = "Battle"
const ATTACK = "Attack"
const DAMAGE = "Damage"
const DEATH = "Death"
const WALK = "Walk"
const RUNNING = "Running"
const JUMP = "Jump"


var player: DummyPlayer

func _ready() -> void:
	await owner.ready
	player = owner as DummyPlayer
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
