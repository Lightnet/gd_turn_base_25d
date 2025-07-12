extends Node3D

@onready var player: DummyPlayer = $"../player_sprite3d1"

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("down"):
		var state = player.animation_state.state
		state.finished.emit(state.ATTACK)
	if event.is_action_pressed("right"):
		var state = player.animation_state.state
		state.finished.emit(state.DEATH)
	if event.is_action_pressed("left"):
		var state = player.animation_state.state
		state.finished.emit(state.IDLE)
	if event.is_action_pressed("up"):
		var state = player.animation_state.state
		state.finished.emit(state.DAMAGE)
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass
