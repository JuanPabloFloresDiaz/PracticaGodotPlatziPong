extends CharacterBody2D

const SPEED = 400 # Lo puse en mayúsculas por convención de constantes

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO 
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
		
	move_and_slide()
	position.y = clamp(position.y, 0, 867)
	position.x = 20 
