extends Node


var obs = ObsWebsocketSetup.obs


func action():
	print(obs.send_command("GetSceneList"))
	change_scene()

func set_button_scene():
	pass

func change_scene():
	pass
