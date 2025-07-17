extends Control

# required mannual create new research and not prefab or preset item.

var player_data:PlayerData

func _ready() -> void:
	
	pass

func _process(delta: float) -> void:
	
	pass

func _on_btn_save_pressed() -> void:
	player_data = PlayerData.new()
	var resaerch_data:ResearchData = ResearchData.new()
	resaerch_data.name = "test"
	player_data.researches.append(resaerch_data)
	
	resaerch_data = ResearchData.new()
	resaerch_data.name = "test2"
	player_data.researches.append(resaerch_data)
	
	# Save the resource to a file
	var save_path = "res://player_data_test.tres"
	
	var error = ResourceSaver.save(player_data, save_path)
	if error == OK:
		print("Resource saved successfully!")
	else:
		print("Error saving resource: ", error)
	pass 
	
	pass

func _on_btn_load_pressed() -> void:
	
	pass
