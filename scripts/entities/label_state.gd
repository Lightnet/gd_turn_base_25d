extends Label
@onready var label_state: Label = $"."
@export var player: DummyPlayer

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	label_state.text = str(player.animation_state.state.name)
	pass
