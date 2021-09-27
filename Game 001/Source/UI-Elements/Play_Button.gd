tool
extends Button

export(String, FILE) var next_scene_path := ''
onready var scene_tree = get_tree()

func _on_Play_Button_button_up():
	scene_tree.change_scene(next_scene_path)

func _get_configuration_warning() -> String:
	if next_scene_path == '':
		return "Next Scene Path not Set"
	else:
		return ''
