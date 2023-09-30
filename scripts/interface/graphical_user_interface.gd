extends Control

@onready var settings_button = get_node('Panel/MarginContainer/VBoxContainer/SettingsButton')
@onready var connection_settings = get_node('Panel/MarginContainer/VBoxContainer/ConnectionSettings')
@onready var main_grid = get_node('Panel/MarginContainer/VBoxContainer/MainGrid')


func _ready() -> void:
	set_theme(ThemeD.current_theme)
	settings_button.pressed.connect(swap_menu)

func swap_menu() -> void:
	if main_grid.visible == true:
		main_grid.hide()
		connection_settings.show()
	elif connection_settings.visible == true:
		connection_settings.hide()
		main_grid.show()

