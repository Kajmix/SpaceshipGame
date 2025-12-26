extends CharacterBody2D
const SPEED = 150

func _physics_process(_delta: float) -> void:
	var dir = Vector2.ZERO
	if Input.is_action_pressed("up"):
		dir = Vector2.UP.rotated(rotation)
	if Input.is_action_pressed("down"):
		dir = Vector2.DOWN.rotated(rotation)
	if Input.is_action_pressed("left"):
		rotate(-0.1)
	if Input.is_action_pressed("right"):
		rotate(0.1)
	var target = dir * SPEED
	velocity = velocity.lerp(target, 0.1)
	move_and_slide()
	

func _on_enemy_area2d_entered(area: Area2D) -> void:
	print("works")
	if area.is_in_group("Enemy"):
		print("U died ;c") #for future nalio - change death screen
