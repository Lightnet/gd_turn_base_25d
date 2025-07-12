extends Resource

## need more refs
## hand, weapon, throw object.
class_name HitInfo


@export var name:String = "HitInfo"
@export var amount_points:float = 1.0
## damage, heal, buff, debuff types to handle function damage/heal or de/buff
@export var type:String = ""
@export var owner_name:String = "None"
var owner:Node3D
