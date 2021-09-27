extends Area2D

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")
onready var audio_coin: AudioStreamPlayer = get_node("Coin_sound")
signal coin_pick_up
export var score := 100

func _on_Coin_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		audio_coin.play()
		PlayerData.score += score
		yield(audio_coin,"finished")
		anim_player.play("FadeOut")

