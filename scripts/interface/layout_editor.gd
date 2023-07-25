extends HBoxContainer

@onready var decrease_column_button = $ColumnEditorContainer/RemoveColumnButton
@onready var increase_column_button = $ColumnEditorContainer/AddColumnButton
@onready var lock_column_button = $ColumnEditorContainer/LockColumnsButton
@onready var decrease_row_button = $RowEditorContainer/RemoveRowButton
@onready var increase_row_button = $RowEditorContainer/AddRowButton
@onready var lock_row_button = $RowEditorContainer/LockRowsButton
@onready var button_grid = get_node('/root/GUI/PanelContainer/VBoxContainer/MainGrid/VBoxContainer/GridContainer')
@onready var grid_button = preload('res://scenes/interface/grid_button.tscn')
var buttons : Array
var rows : int = 1
var first : bool = true


func _ready() -> void:
	decrease_column_button.pressed.connect(remove_column)
	increase_column_button.pressed.connect(add_column)
	decrease_row_button.pressed.connect(remove_row)
	increase_row_button.pressed.connect(add_row)
	lock_column_button.toggled.connect(lock_columns)
	lock_row_button.toggled.connect(lock_rows)

func lock_columns(toggle : bool) -> void:
	if toggle == true:
		decrease_column_button.disabled = true
		increase_column_button.disabled = true
	if toggle == false:
		decrease_column_button.disabled = false
		increase_column_button.disabled = false

func lock_rows(toggle : bool) -> void:
	if toggle == true:
		decrease_row_button.disabled = true
		increase_row_button.disabled = true
	if toggle == false:
		decrease_row_button.disabled = false
		increase_row_button.disabled = false

func remove_column() -> void:
	if buttons.is_empty() == false:
		if button_grid.columns >= 2:
			button_grid.columns -= 1
			for n in rows:
				var button = buttons.pop_back()
				get_node(button).queue_free()

func add_column() -> void:
	if rows >= 2:
		for n in rows - 1:
			var button = grid_button.instantiate()
			button_grid.add_child(button, true)
			button.size_flags_horizontal = 3
			button.size_flags_vertical = 3
			buttons.append(button.get_path())
	button_grid.columns += 1
	var button = grid_button.instantiate()
	button.size_flags_horizontal = 3
	button.size_flags_vertical = 3
	button_grid.add_child(button, true)
	buttons.append(button.get_path())

func add_row() -> void:
	for n in button_grid.columns - 1:
		var button = grid_button.instantiate()
		button_grid.add_child(button, true)
		button.size_flags_horizontal = 3
		button.size_flags_vertical = 3
		buttons.append(button.get_path())
	var button = grid_button.instantiate()
	button_grid.add_child(button, true)
	button.size_flags_horizontal = 3
	button.size_flags_vertical = 3
	buttons.append(button.get_path())
	rows += 1

func remove_row() -> void:
	if buttons.is_empty() == false:
		if rows >= 2:
			rows -= 1
			for n in button_grid.columns:
				var button = buttons.pop_back()
				get_node(button).queue_free()

