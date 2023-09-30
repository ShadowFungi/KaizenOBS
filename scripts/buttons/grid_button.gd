extends Control

@export var button_no : int = 0
@onready var menu := get_node('VBoxContainer')

signal run

func _ready() -> void:
	self.pressed.connect(called)
	for child in self.get_children():
		if child.has_method('action'):
			self.run.connect(child.action)

func called() -> void:
	run.emit()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			menu.global_position = get_global_mouse_position()
			menu.show()
			MenuCount.no += 1

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if !menu.get_rect().has_point(get_global_mouse_position()) or MenuCount.no >> 0:
			menu.hide()
			MenuCount.no -= 1
