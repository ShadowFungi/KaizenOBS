extends Node


# Create dictionary to define list of available themes (only included themes should be in this list)
@onready var themes : Dictionary = {
	'Godot': 'res://themes/Godot.theme',
	'Kaizen': 'res://themes/Kaizen.theme'
}

# Set default theming variables
@onready var default_theme = load(ThemeD.themes.get('Kaizen'))
@onready var current_theme = load(ThemeD.themes.get('Kaizen'))


