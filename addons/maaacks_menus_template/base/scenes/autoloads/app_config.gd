extends Node

func _ready() -> void:
	AppSettings.set_from_config_and_window(get_window())
