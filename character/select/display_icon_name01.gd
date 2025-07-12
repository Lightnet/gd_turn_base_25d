extends HBoxContainer

@onready var button = $Button

var characterData:CharacterData
signal characterSelect(_characterData:CharacterData)

func set_characterData(_characterData):
	print("_name: ", _characterData.Name)
	characterData = _characterData
	button.text = _characterData.Name

func _on_button_pressed():
	characterSelect.emit(characterData)
	pass
