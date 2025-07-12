extends Control

@onready var characters = $"."
@onready var game_single_player = $"../GameSinglePlayer"
@onready var character_info = $CharacterInfo

@onready var character_list = $ScrollContainer/CharacterList
@onready var character_display = preload("res://character/select/display_icon_name.tscn")
func _ready():
	print("PARTY SIZE: ",GameData.party.size())
	setup_characters()

func _on_btn_back_pressed():
	characters.hide()
	game_single_player.show()
	pass 

func setup_characters():
	
	for child in character_list.get_children():
		child.characterSelect.disconnect(characterSelect)
		child.queue_free()
	
	for character in GameData.characters:
		var newCharacterDisplay = character_display.instantiate()
		character_list.add_child(newCharacterDisplay)
		newCharacterDisplay.set_characterData(character)
		newCharacterDisplay.characterSelect.connect(characterSelect)
	pass

func characterSelect(_characterData:CharacterData):
	character_info.update_character_info(_characterData)
	pass
