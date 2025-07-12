extends CharacterBody3D

@export var isRightFace = false

@onready var animated_sprite_3d = $AnimatedSprite3D

signal action(_name:String)

signal attack_finish(_name:String)

func _ready():
	print("set up animated")
	anim_idle()
	is_right_face(isRightFace)
	animated_sprite_3d.connect("animation_finished",_on_animate_finish)

func _process(delta):
	#if animated_sprite_3d.is_playing() == false and animated_sprite_3d.animation == "punch":
		#animated_sprite_3d.play("idle")
	pass

func _on_animate_finish():
	#print("NAME: ", _name)
	print("ANIMATION FINISH ")
	pass

func anim_attack():
	animated_sprite_3d.play("punch")
	pass

func anim_idle():
	animated_sprite_3d.play("idle")
	pass
	
func anim_hurt():
	animated_sprite_3d.play("hurt")
	pass
	
func is_right_face(_flip=false):
	animated_sprite_3d.flip_h=_flip
	pass


func _on_animated_sprite_3d_animation_finished():
	#print("anim finish: ")
	if animated_sprite_3d.animation == "punch":
		attack_finish.emit()
		animated_sprite_3d.play("idle")
	if animated_sprite_3d.animation == "hurt":
		animated_sprite_3d.play("idle")
	pass # Replace with function body.

func _on_animated_sprite_3d_animation_looped():
	#print("anim loop")
	if animated_sprite_3d.animation == "punch":
		animated_sprite_3d.play("idle")
	pass # Replace with function body.
