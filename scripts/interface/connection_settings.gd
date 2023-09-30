extends Control

# Get LineEdit nodes
@onready var password_line = get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/PasswordContainer/LineEdit')
@onready var host_line = get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/HostContainer/LineEdit')
@onready var port_line = get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/PortContainer/LineEdit')

# Get Button nodes
@onready var password_button = get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/PasswordContainer/Button')
@onready var host_button = get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/HostContainer/Button')
@onready var port_button = get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/PortContainer/Button')

@onready var connect_button = get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ConnectButton')
@onready var save_button = get_node("VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/SaveLoadContainer/SaveButton")
@onready var load_button = get_node("VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/SaveLoadContainer/LoadButton")


func _ready() -> void:
	# Connect functions and nodes
	password_line.text_changed.connect(set_new_password)
	port_line.text_changed.connect(set_new_port)
	host_line.text_changed.connect(set_new_host)
	password_button.pressed.connect(set_password_visible)
	port_button.pressed.connect(set_port_visible)
	host_button.pressed.connect(set_host_visible)
	connect_button.pressed.connect(connect_obs)
	save_button.pressed.connect(ObsWebsocketSettings.save_opts)
	load_button.pressed.connect(ObsWebsocketSettings.load_opts)
	
	var check_for_conf = FileAccess.file_exists("user://websocket.conf")
	# Load previously saved options
	if check_for_conf == true:
		ObsWebsocketSettings.load_opts()

func set_new_password(password):
	ObsWebsocketSettings.password = password

func set_new_host(password):
	ObsWebsocketSettings.host = password

func set_new_port(password):
	ObsWebsocketSettings.port = password

func set_password_visible():
	if password_line.secret == false:
		password_line.secret = true
	elif password_line.secret == true:
		password_line.secret = false

func set_port_visible():
	if port_line.secret == false:
		port_line.secret = true
	elif port_line.secret == true:
		port_line.secret = false

func set_host_visible():
	if host_line.secret == false:
		host_line.secret = true
	elif host_line.secret == true:
		host_line.secret = false

func connect_obs():
	ObsWebsocketSetup.start_obs_websocket()
