extends Control

@export var entity_friend:Node
@export var entity_foe:Node

@onready var entity_character = preload("res://gamemode/turnbase/entity_character01.tscn")
@onready var game_single_player = $"../GameSinglePlayer"
@onready var battle_game = $"."


#2D list
@onready var party_members = $VBoxContainer/HBoxContainer2/PartyMembers
@onready var entity_members = $VBoxContainer/HBoxContainer2/EntityMembers

func _ready():
	query_party()
	query_enemies()

func query_party():
	
	for child in party_members.get_children():
		child.queue_free()
	
	for member in GameData.party:
		print("party")
		print("member: ", member)
		print("member Name: ", member.Name)
		
		var ent_char = entity_character.instantiate()
		
		party_members.add_child(ent_char)
		ent_char.set_character(member)
		
		#if entity_friend:
			#entity_friend.set_health(member.Health)
		pass
	pass

func query_enemies():
	
	for child in entity_members.get_children():
		child.queue_free()
		
	for member in GameData.enemies:
		print("enemies")
		print("member: ", member)
		print("member Name: ", member.Name)
		
		var ent_char = entity_character.instantiate()
		entity_members.add_child(ent_char)
		ent_char.set_character(member)
		
		#if entity_foe:
			#entity_foe.set_health(member.Health)
		pass
	pass

func _on_btn_attack_pressed():
	print("Attack")
	GameData.enemies[0].Health = GameData.enemies[0].Health - GameData.party[0].Attack
	#if entity_foe:
		#entity_foe.set_health(GameData.enemies[0].Health)
	for member in entity_members.get_children():
		if member.character_data == GameData.enemies[0]:
			member.set_health(GameData.enemies[0].Health)
			break
			#pass
	
	GameData.party[0].Health = GameData.party[0].Health - GameData.enemies[0].Attack
	
	for member in party_members.get_children():
		if member.character_data == GameData.party[0]:
			member.set_health(GameData.party[0].Health)
			break
			
	#if entity_friend:
		#entity_friend.set_health(GameData.party[0].Health)
	
	pass 

func _on_btn_defend_pressed():
	print("Defend")
	pass


func _on_btn_back_pressed():
	battle_game.hide()
	game_single_player.show()
	pass 
