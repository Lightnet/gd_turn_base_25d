extends MarginContainer

signal _on_delete(_name:String)

@onready var label_name: Label = $VBoxContainer/Label_Name
@onready var label_gender: Label = $VBoxContainer/Label_Gender
@onready var btn_create: Button = $VBoxContainer/btn_create
@onready var btn_delete: Button = $VBoxContainer/btn_delete
@onready var btn_load: Button = $VBoxContainer/btn_load

@export var next_gui:String

var player_data:PlayerData

func _ready() -> void:
	if player_data:
		set_player_data(player_data)
	else:
		btn_delete.hide()
		btn_load.hide()
	pass

#func _process(delta: float) -> void:
	#pass

func set_player_data(_player_data:PlayerData):
	player_data = _player_data
	print("_player_data.name:", _player_data.name)
	label_name.text = _player_data.name
	label_gender.text = _player_data.gender
	btn_create.hide()
	btn_delete.show()
	btn_load.show()
	pass

func _on_btn_delete_pressed() -> void:
	_on_delete.emit(player_data.name)
	pass

func _on_btn_load_pressed() -> void:
	print("load > hub menu: ", player_data.name)
	#GameData.player_data = player_data
	Global.set_player_data(player_data)
	if not next_gui.is_empty():
		Global.game_controller.change_gui_scene(next_gui)
	pass
