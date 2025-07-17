extends Control


@onready var ui_hub_area: Control = $"."
@onready var label_name: Label = $MarginContainer/VBoxContainer/HBoxContainer3/Label_Name
@onready var window_save: Window = $Window_Save
@onready var window_quit: Window = $Window_Quit

@export var ui_settings:String

func _ready() -> void:
	if label_name:
		#label_name.text = GameData.player_data.name
		label_name.text = Global.player_data.name
	window_save.hide()
	#pass

#func _process(delta: float) -> void:
	#pass

func _on_btn_save_pressed() -> void:
	ui_hub_area.hide()
	window_save.show()
	pass

#show quit window
func _on_btn_quit_pressed() -> void:
	window_quit.show()
	ui_hub_area.hide()
	pass

func _on_btn_settings_pressed() -> void:
	if not ui_settings.is_empty():
		Global.game_controller.change_gui_scene(ui_settings)
	pass

func _on_window_save_close_requested() -> void:
	ui_hub_area.show()
	window_save.hide()
	pass

func _on_btn_save_cancel_pressed() -> void:
	ui_hub_area.show()
	window_save.hide()
	pass 

func _on_btn_save_file_pressed() -> void:
	ui_hub_area.show()
	window_save.hide()
	GameData.save_player_slot_data(Global.player_data)
	
	pass 

func _on_window_quit_close_requested() -> void:
	window_quit.hide()
	ui_hub_area.show()
	pass

func _on_btn_quit_okay_pressed() -> void:
	get_tree().quit()
	pass

func _on_btn_quit_cancel_pressed() -> void:
	window_quit.hide()
	ui_hub_area.show()
	pass
