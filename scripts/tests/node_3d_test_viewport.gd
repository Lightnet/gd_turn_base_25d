


extends Node3D

@export var player1:Node3D
@export var player2:Node3D

func _ready():
	# Check SubViewport paths
	var player1_viewport = player1.get_node("Sprite3D").texture.viewport_path
	var player2_viewport = player2.get_node("Sprite3D").texture.viewport_path
	print("Player1 SubViewport path: ", player1_viewport)
	print("Player2 SubViewport path: ", player2_viewport)
	
	# Check if SubViewports are different instances
	var player1_subviewport = player1.get_node("Sprite3D/Viewport2D")
	var player2_subviewport = player2.get_node("Sprite3D/Viewport2D")
	print("Player1 SubViewport: ", player1_subviewport)
	print("Player2 SubViewport: ", player2_subviewport)
	
	# Check AnimationPlayer instances
	var player1_anim = player1.get_node("Sprite3D/Viewport2D/AnimationPlayer")
	var player2_anim = player2.get_node("Sprite3D/Viewport2D/AnimationPlayer")
	print("Player1 AnimationPlayer: ", player1_anim)
	print("Player2 AnimationPlayer: ", player2_anim)
