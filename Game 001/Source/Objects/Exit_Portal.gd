tool
extends Area2D

onready var anim_player : AnimationPlayer = get_node("AnimationPlayer")

export var next_scene : PackedScene

func _on_Exit_Portal_body_entered(body):
	teleport()

func _get_configuration_warning() -> String: # forces next_level to be full
	if next_scene == null:
		return "the next scene property can't be empty"
	else:
		return ''
		
func teleport() -> void: # telepot player
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished") #finshes fade_in animation before doing the next line
	get_tree().change_scene_to(next_scene)



