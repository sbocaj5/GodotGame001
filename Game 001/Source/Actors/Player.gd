extends Actors_base

export var stomp_impulse := 1000.0

# Callback Functions
func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)
	get_node("Killenemy").play()

func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:
	player_die() #similar to the Delete() in unity

func _physics_process(delta: float) -> void:
	var is_jump_interupted := Input.is_action_just_released("Jump") and _velocity.y < 0.0
	var direction := get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func get_direction () -> Vector2:
		var new_directon := Vector2 (Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0) 
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			new_directon =  Vector2(new_directon.x, -1.0)
			get_node("JumpAudio").play()
		else:
			new_directon = Vector2(new_directon.x, 0.0)
		
		return new_directon

func calculate_move_velocity (linear_velocity : Vector2, 
							  direction : Vector2 ,
							  speed : Vector2,
							  interupted: bool
							  ) -> Vector2:
	
	var new_velocity := linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	if interupted:
		get_node("JumpAudio").stop()
		new_velocity.y = 0.0
	return new_velocity

func calculate_stomp_velocity(linear_velocity : Vector2, impulse : float) -> Vector2:
	var new_velocity := linear_velocity
	new_velocity.y = -impulse
	return new_velocity
	
func player_die() -> void:
	PlayerData.deaths += 1
	queue_free()
