extends Control

const UI_PLAYER_SLOT = preload("res://scenes/ui/ui_player_slot.tscn")

@onready var ui_create_player: Control = $UICreatePlayer
@onready var ui_game_slots: CenterContainer = $CenterContainer
@onready var h_player_data_slot: HBoxContainer = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/HPlayerDataSlot
@onready var label_delete_name: Label = $UIDelete/CenterContainer/PanelContainer/CenterContainer/MarginContainer/VBoxContainer/HBoxContainer/Label_Delete_Name
@onready var ui_delete: Control = $UIDelete

var current_player_name:String = ""

func _ready() -> void:
	_update_player_slot_list()
	if ui_create_player:
		print("init connect update_player_slots")
		ui_create_player.update_player_slots.connect(_update_player_slot_list)

func _update_player_slot_list():
	print("_update_player_slot_list")
	for player_data in h_player_data_slot.get_children():
		h_player_data_slot.remove_child(player_data)
		player_data.queue_free()
		
	var slot_files = GameData.get_player_slot_datas()
	for slot in slot_files:
		print(slot)
		var player_data2 = GameData.load_player_data_file(slot)
		if player_data2:
			print("player_data2:", player_data2)
			var player_slot = UI_PLAYER_SLOT.instantiate()
			player_slot._on_delete.connect(_on_delete)
			h_player_data_slot.add_child(player_slot)
			player_slot.set_player_data(player_data2)
	pass

#func _process(delta: float) -> void:
	#pass

func _on_delete(_name:String):
	ui_game_slots.hide()
	ui_delete.show()
	
	current_player_name = _name
	label_delete_name.text = _name
	pass

func _on_btn_create_pressed() -> void:
	ui_game_slots.hide()
	ui_create_player.show()
	pass

func _on_btn_delete_confirm_pressed() -> void:
	ui_delete.hide()
	ui_game_slots.show()
	
	print("DELETE HERE?", current_player_name)
	if GameData.delete_player_data_file(current_player_name):
		print("DELETE FILE", current_player_name)
		_update_player_slot_list()
	pass
	
func _on_btn_delete_cancel_pressed() -> void:
	ui_delete.hide()
	ui_game_slots.show()
	pass
