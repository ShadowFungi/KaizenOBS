extends Control


@onready var password_line = get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/PasswordContainer/LineEdit') 
@onready var connect_button = get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ConnectButton') 

func _ready() -> void:
	password_line.text_changed.connect(set_new_password)
	connect_button.pressed.connect(connect_obs)

func set_new_password(password):
	ObsWebsocketSettings.password = password

func connect_obs():
	ObsWebsocketSetup.start_obs_websocket()

