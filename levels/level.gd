extends Node2D
var GameStarted = false
var PlayerScore = 0
var OponenteScore = 0

func _ready():
	_actualizar_marcador()
	# Esperamos un microsegundo a que la física se asiente
	await get_tree().create_timer(0.1).timeout
	GameStarted = true
	
func _actualizar_marcador():
	var puntaje_player = str(PlayerScore)
	var puntaje_oponente = str(OponenteScore)
	$MarcadorPlayer.text = "Jugador " + puntaje_player + " - " + puntaje_oponente + " Oponente"


func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(940, 520)
	$Ball.reset_ball()
	
func _on_arco_player_body_entered(body: Node2D) -> void:
	if GameStarted:
		OponenteScore += 1
		_actualizar_marcador()
		_restart_game()

func _on_arco_oponente_body_entered(body: Node2D) -> void:
	if GameStarted:
		PlayerScore += 1
		_actualizar_marcador()
		_restart_game()
