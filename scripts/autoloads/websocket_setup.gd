extends Control


const ObsWebsocket: GDScript = preload("res://addons/obs-websocket/obs-websocket.gd")

var obs : Node = ObsWebsocket.new()


func start_obs_websocket() -> void:
	add_child(obs)
	obs.password = ObsWebsocketSettings.password
	obs.host = ObsWebsocketSettings.host
	obs.port = ObsWebsocketSettings.port
	
	obs.connect("data_received", Callable(self,"_obs_data_received"))
	obs.data_received.connect(func(data) -> void:
		print(data.get_as_json())
	)
	
	obs.establish_connection()
	
	await  obs.connection_authenticated
	
	obs.send_command("GetVersion")

func _obs_data_received(_arg):
	return
