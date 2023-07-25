extends Button


func _ready() -> void:
	self.pressed.connect(called)

func called() -> void:
	for child in get_children():
		child.action()
