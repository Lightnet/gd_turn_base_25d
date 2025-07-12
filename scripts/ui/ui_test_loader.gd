extends Control

@export var scene_path:String

#func _ready() -> void:
	#pass

#func _process(delta: float) -> void:
	#pass
	
func _on_button_pressed() -> void:
	if scene_path and scene_path.length() > 0:
		#print("load scene?")
		Global.next_scene = scene_path
		Global.game_controller.change_gui_scene("res://scenes/loading_screen.tscn")
	pass
