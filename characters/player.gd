extends CharacterBody2D

const SPEED = 400 # Lo puse en mayúsculas por convención de constantes

func _physics_process(delta: float) -> void:
	# 1. Reiniciamos la velocidad en cada frame (para que no se mueva solo)
	velocity = Vector2.ZERO 
	
	# 2. Capturamos el input
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
		
	# 3. ¡ESTA ES LA CLAVE! move_and_slide usa el valor de 'velocity' automáticamente
	move_and_slide()
