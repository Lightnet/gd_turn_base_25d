# Information:
	
	Note that prefab for save and load does not work. Meaning it need to create new id class every time. Reason store id in which search all.
	
	Just say that prefab id does not work with save as does save varaible since default to when setup.

```
#this does not work but ref.
const PLAYER_DATA_SETUP = preload("res://prefabs/dummy_player/player_data_setup.tres")
```

```
player_data.researches = PLAYER_DATA_SETUP.researches
```
Does not work due to how id system work as ref from other files matches it.

```
for resaerch in PLAYER_DATA_SETUP.researches:
	var _resaerch:ResearchData = ResearchData.new()
	_resaerch.name = resaerch.name
	_resaerch.is_unlocked = resaerch.is_unlocked
	player_data.researches.append(_resaerch)
```
This works due is not direct copy from id. It create new id class.

```
[ext_resource type="Script" path="res://research/research_data.gd" id="3_mgeub"]
[ext_resource type="Script" path="res://scripts/entities/player_data.gd" id="4_2p3nl"]


[sub_resource type="Resource" id="Resource_y7l61"]
script = ExtResource("3_mgeub")
name = "Box Car"
description = ""
is_unlocked = true
cost = 0
level = 0

[sub_resource type="Resource" id="Resource_idt0p"]
script = ExtResource("3_mgeub")
name = "Flat Car"
description = ""
is_unlocked = false
cost = 0
level = 0

[sub_resource type="Resource" id="Resource_psmld"]
script = ExtResource("3_mgeub")
name = "Locomotive"
description = ""
is_unlocked = false
cost = 0
level = 0

[resource]
script = ExtResource("4_2p3nl")
name = "a"
gender = "male"
tech_point = 0
#...
researches = Array[ExtResource("3_mgeub")]([SubResource("Resource_y7l61"), SubResource("Resource_idt0p"), SubResource("Resource_psmld"), SubResource("Resource_y7l61")])
```

From I get is that required new class varaible for new id system to handle that can't be edit due to prefab for file.
