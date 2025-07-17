extends Button

@export var audio_stream_player: AudioStreamPlayer

func _ready() -> void:
	pressed.connect(play_audio)
	pass

func play_audio():
	if audio_stream_player:
		audio_stream_player.play()
	pass
