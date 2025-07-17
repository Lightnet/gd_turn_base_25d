extends CharacterBody3D
class_name DummyPlayer

@export var animation_state: Node
@export var animation_player: AnimationPlayer
@export var state_machine:StateMachine
@export var id:int = 0

@export var stats_data:StatsData
## hand attack
@export var hit_info:HitInfo

@export var target:Node3D
@export var targets:Array[Node3D]
@export var is_single_target:bool = true

@export var is_right:bool = true
@onready var sprite_3d: Sprite3D = $Sprite3D

@export var is_controller:bool = false

func _ready() -> void:
	# print(animation_player.get_animation_list())
	set_is_right(is_right)
	if not stats_data:
		stats_data = StatsData.new()
	if not hit_info:
		hit_info = HitInfo.new()
	pass

#func _process(delta: float) -> void:
	#pass

#func _physics_process(delta: float) -> void:
	#pass

func attack():
	#print(animation_player)
	#if animation_state:
		#animation_state.attack()
	animation_state.state.finished.emit(animation_state.state.ATTACK)
	#pass

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	#if anim_name == "attack":
		#animation_state.state.finished.emit(animation_state.state.IDLE)
	pass

func hurt(_hit_info:HitInfo):
	
	if stats_data and _hit_info:
		stats_data.health -= _hit_info.amount_points
	animation_state.state.finished.emit(animation_state.state.DAMAGE)
	pass
	
func set_is_right(is_face):
	is_right = is_face
	if is_face:
		sprite_3d.flip_h = false
	else:
		sprite_3d.flip_h = true

func get_hit_info()->HitInfo:
	
	return hit_info
