extends VBoxContainer

@onready var l_name = $HBoxContainer/LName
@onready var lhp = $HBoxContainer2/LHP
@onready var lmp = $HBoxContainer3/LMP
@onready var l_attack = $HBoxContainer4/LAttack
@onready var l_defense = $HBoxContainer5/LDefense

func update_character_info(_characterData:CharacterData):
	l_name.text = _characterData.Name
	lhp.text = str(_characterData.HealthPoint)
	lmp.text = str(_characterData.MagicPoint)
	l_attack.text = str(_characterData.Attack)
	l_defense.text = str(_characterData.Defense)
	pass
