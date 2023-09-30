extends Node

# Set the default values used by OBS websocket
var host : String = "127.0.0.1"
var port : String = "4455"
var password : String = ""


func save_opts():
	# Make a new ConfigFile instance
	var conf = ConfigFile.new()
	# Set the values for the config file to save
	conf.set_value("Websocket", "host", host)
	conf.set_value("Websocket", "port", port)
	conf.set_value("Websocket", "password", password)
	# Save the configuration
	conf.save("user://websocket.conf")

func load_opts():
	# Make a new ConfigFile instance
	var conf = ConfigFile.new()
	# Load the config file
	var err = conf.load("user://websocket.conf")
	# Check if the config is OK
	if err != OK:
		return
	# Set variables to loaded values
	host = conf.get_value("Websocket", "host")
	port = conf.get_value("Websocket", "port")
	password = conf.get_value("Websocket", "password")
	# Check if the ConnectionSettings node is loaded
	var con_set = get_node_or_null("/root/GUI/PanelContainer/VBoxContainer/ConnectionSettings")
	if con_set != null:
		# Get LineEdit nodes
		var password_line = con_set.get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/PasswordContainer/LineEdit')
		var host_line = con_set.get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/HostContainer/LineEdit')
		var port_line = con_set.get_node('VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/PortContainer/LineEdit')
		password_line.set_text(ObsWebsocketSettings.password)
		host_line.set_text(ObsWebsocketSettings.host)
		port_line.set_text(ObsWebsocketSettings.port)
