extends HBoxContainer

@onready var label_name: Label = $Label_Name
@onready var label_cost: Label = $Label_Cost
@onready var btn_unlock: Button = $btn_unlock

@export var research_data:ResearchData

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func set_resaerch_data(_research_data:ResearchData):
	research_data = _research_data
	label_name.text = _research_data.name
	label_cost.text = str(_research_data.cost)
	if research_data.is_unlocked:
		btn_unlock.disabled = true
	else:
		btn_unlock.disabled = false
	pass


func _on_btn_unlock_pressed() -> void:
	print("click...")
	research_data.is_unlocked = true
	btn_unlock.disabled = true
	#for _research_data in Global.player_data.resaerch_tree.researches:
	for _research_data in Global.player_data.researches:
		if _research_data.name == research_data.name:
			print("SAVE?")
			_research_data.is_unlocked = true
			research_data.is_unlocked = true
			pass
		pass
	pass
	#if research_data:
		#Global.player_data.append_resaerch(research_data)
