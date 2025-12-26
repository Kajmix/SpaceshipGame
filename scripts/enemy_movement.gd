extends CharacterBody2D

@export var SPEED = 60
@onready var player = get_node("/root/MainGameScene/Player")  # upewnij się, że ścieżka jest poprawna

func _physics_process(_delta):
	if not player:
		return

	# kierunek do gracza
	var dir = (player.global_position - global_position).normalized()

	# ustaw rotację z offsetem jeśli sprite nie patrzy w prawo
	rotation = dir.angle() + deg_to_rad(-270)  # dopasuj -90 lub +90 w zależności od sprite

	# interpolacja prędkości
	velocity = velocity.lerp(dir * SPEED, 0.1)
	
	move_and_slide()
