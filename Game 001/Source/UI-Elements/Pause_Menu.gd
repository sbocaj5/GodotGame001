extends Control


onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("Pause Overlay")
onready var score: Label = get_node("Label")
onready var pause_label: Label = get_node("Pause Overlay/Title")


var paused := false setget set_paused



func _ready() -> void:
	PlayerData.connect("score_updated",self,"update_interface")	
	PlayerData.connect("player_died",self, "_playerData_player_on_died")
	update_interface()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and pause_label.text != "You Died":
		self.paused = not paused
		scene_tree.set_input_as_handled()

func _playerData_player_on_died() ->void:
	self.paused = true
	pause_label.text = "You Died"
	


func update_interface():
	score.text = "Score: %s" %PlayerData.score
		

func set_paused(value: bool) -> void:
	pause_mode = value
	scene_tree.paused = value
	pause_overlay.visible = value
