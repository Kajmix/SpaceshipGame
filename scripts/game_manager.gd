extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval = 2.0
@export var spawn_area = Rect2(Vector2.ZERO, Vector2(800, 600))

var timer = 0.0
@onready var player = get_node("/root/MainGameScene/Player")  # upewnij się, że ścieżka jest poprawna

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0
		spawn_enemy()

func spawn_enemy():
	if not player:
		return
	var enemy = enemy_scene.instantiate()
	enemy.global_position = spawn_area.position + Vector2(randf() * spawn_area.size.x, randf() * spawn_area.size.y)
	
	# ustawienie rotacji w stronę gracza
	var dir = (player.global_position - enemy.global_position).normalized()
	enemy.rotation = dir.angle()
	enemy.SPEED = randi_range(50, 120)
	
	get_parent().add_child(enemy)
