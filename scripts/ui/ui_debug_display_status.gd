extends Node3D

@export var character:Node3D
@export var label_state_animation: Label
@export var label_state_machine: Label
@export var label_health: Label

#func _ready() -> void:
	#pass

func _process(delta: float) -> void:
	if character:
		var state_animation = character.animation_state
		var state_machine = character.state_machine
		#state_machine
		var stats = character.stats_data
		
		if label_state_animation:
			label_state_animation.text = state_animation.state.name
		if label_state_machine:
			label_state_machine.text = state_machine.state.name
		if label_health:
			#print("HEALTH")
			label_health.text = str(stats.health) + "/" + str(stats.health_max)
	pass
