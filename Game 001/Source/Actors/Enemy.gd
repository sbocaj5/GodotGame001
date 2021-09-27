extends Actors_base

export var score := 50

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x

# Call Back Scripts
func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		if body.global_position.y > get_node("StompDetector").global_position.y:
			return
		else:
			die()
	else:
		return
	
	
	
func _physics_process(delta: float) -> void:
	if is_on_wall():
		get_node("WallSound").play()
		_velocity *= -1.0
	_velocity.y += gravity * delta
	_velocity.y = move_and_slide(_velocity,FLOOR_NORMAL).y 

func die():
	get_node("EnemyCollisionShape").disabled = true
	PlayerData.score += score
	queue_free()
	
