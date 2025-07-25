extends Control

@export var load_scene:PackedScene
@export var in_time:float = 0.5
@export var fade_in_time:float = 1.5
@export var pause_time:float = 1.5
@export var fade_out_time:float = 1.5
@export var out_time:float = 0.5
@export var splash_screen_container:Node
@export var splash_screens:Array

@export var next_scene:String = ""
@export var next_gui:String = ""

func _ready() -> void:
	get_screens()
	fade()
	pass

func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_pressed():
		#get_tree().change_scene_to_file()
		print("skipping loading screen")
		next()

func get_screens()->void:
	splash_screens = splash_screen_container.get_children()
	for screen in splash_screens:
		screen.modulate.a = 0.0
		
func fade():
	for screen in splash_screens:
		var tween = self.create_tween()
		tween.tween_interval(in_time)
		tween.tween_property(screen,"modulate:a", 1.0, fade_in_time)
		tween.tween_interval(pause_time)
		tween.tween_property(screen,"modulate:a", 0.0, fade_out_time)
		tween.tween_interval(out_time)
		await tween.finished
		
	#get_tree()
	#print("change scene...")
	next()

func next():
	if not next_gui.is_empty():
		Global.game_controller.change_gui_scene(next_gui)
	if not next_scene.is_empty():
		Global.game_controller.change_3d_scene(next_scene)
