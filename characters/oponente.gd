extends CharacterBody2D

const SPEED = 600.0
@onready var ball = get_parent().find_child("Ball")

func _physics_process(delta):
	velocity.y = _get_oponent_direction() * SPEED
	move_and_slide()
	position.y = clamp(position.y, 0, 867)
	position.x = 1880
	
func _get_oponent_direction():
	
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		else:
			return -1
	else:
		return 0
