extends Control

@onready var vb_researches: VBoxContainer = $MarginContainer/VBoxContainer/HBoxContainer2/ScrollContainer/VBResearchs

const UI_RESEARCH_SLOT = preload("res://scenes/ui/ui_research_slot.tscn")

func _ready() -> void:
	#var research_tree:ResearchTree = Global.player_data.resaerch_tree
	#
	#if not research_tree:
		#print("ERROR...")
		#return
	
	for node in vb_researches.get_children():
		vb_researches.remove_child(node)
	
	for research in Global.player_data.researches:
		if research:
			print("research.is_unlocked: ",research.is_unlocked)
			var ui_resaerch_slot = UI_RESEARCH_SLOT.instantiate()
			vb_researches.add_child(ui_resaerch_slot)
			print(research)
			ui_resaerch_slot.set_resaerch_data(research)
		pass
	pass

#func _process(delta: float) -> void:
	#pass
