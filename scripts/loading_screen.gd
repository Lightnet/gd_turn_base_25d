extends Control

@onready var progress_number: Label = $CenterContainer/MarginContainer/VBoxContainer/HBoxContainer/progress_number
@onready var progress_bar: ProgressBar = $CenterContainer/MarginContainer/VBoxContainer/HBoxContainer2/ProgressBar

var progress = []
var sceneName 
var scene_load_status = 0

func _ready():
	#sceneName = "res:// ... .tscn"
	sceneName = Global.next_scene
	ResourceLoader.load_threaded_request(sceneName)

func _process(delta):
	scene_load_status = ResourceLoader.load_threaded_get_status(sceneName, progress)
	#print("progress[0]:", progress[0])
	progress_bar.value = progress[0]*100
	progress_number.text = str(progress[0]*100)+"%"
	#await get_tree().create_timer(1000).timeout
	
	if progress[0] == 1.0:
		#var packed_scene = ResourceLoader.load_threaded_get(sceneName)
		#get_tree().change_scene_to_packed(packed_scene)
		Global.game_controller.change_gui_scene("res://scenes/ui_dummy.tscn")
		Global.game_controller.change_3d_scene(sceneName)
		pass
