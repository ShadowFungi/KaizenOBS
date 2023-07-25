extends Control

@onready var settings_button = get_node('PanelContainer/VBoxContainer/SettingsButton')
@onready var connection_settings = get_node('PanelContainer/VBoxContainer/ConnectionSettings')
@onready var main_grid = get_node('PanelContainer/VBoxContainer/MainGrid')


func _ready() -> void:
	settings_button.pressed.connect(swap_menu)

func swap_menu() -> void:
	if main_grid.visible == true:
		main_grid.hide()
		connection_settings.show()
	elif connection_settings.visible == true:
		connection_settings.hide()
		main_grid.show()

