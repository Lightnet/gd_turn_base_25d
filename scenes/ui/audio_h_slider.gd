extends HSlider
# https://www.youtube.com/watch?v=aFkRmtGiZCw
@export var spin_box: SpinBox
@export var bus_name:String
@export var bus_index:int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	pass

func _on_value_changed(value:float):
	
	if spin_box:
		spin_box.value = value
		
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
	
	pass
