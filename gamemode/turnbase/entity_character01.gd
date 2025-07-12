extends HBoxContainer

@onready var label_name = $Label_Name
@onready var label_hp = $Label_HP

var character_data:BattleCharacter 

func set_character(_character_data:BattleCharacter):
	character_data = _character_data
	label_name.text = _character_data.Name
	label_hp.text = str(_character_data.Health)
	pass

func set_health(_health):
	label_hp.text = str(_health)
	pass
