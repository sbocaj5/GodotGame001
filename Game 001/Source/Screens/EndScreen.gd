extends Control

onready var message: Label = get_node("Label")

func _ready():
	message.text = message.text %[PlayerData.score, PlayerData.deaths]
