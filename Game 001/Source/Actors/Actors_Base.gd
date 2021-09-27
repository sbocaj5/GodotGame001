extends KinematicBody2D

class_name Actors_base
# Public CONST
const FLOOR_NORMAL := Vector2.UP
#Public Variable Decleration
var _velocity := Vector2.ZERO
export var speed := Vector2(300.0,1000.0)
export var gravity := 3000.0

#Private Variable Decleration

# Physics process is similar to the update function in unity
# it is called every frame and deals with object s that need to collide	
	
	#_velocity.y = max(speed.y,_velocity.y)
	
