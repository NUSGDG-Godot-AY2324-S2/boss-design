extends CharacterBody2D

const ACCELERATION = 5000
const HORIZONTAL_SPEED = 30000
const JUMP_STRENGTH = 90000

func _physics_process(delta):
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var is_jumping = (Input.is_action_just_pressed("ui_up")
		or Input.is_action_just_pressed("jump")) and is_on_floor()
	if direction == -1:
		$AnimatedSprite2D.scale.x = -abs($AnimatedSprite2D.scale.x)
	else:
		$AnimatedSprite2D.scale.x = abs($AnimatedSprite2D.scale.x)
	
	velocity = Vector2(
		direction * HORIZONTAL_SPEED * delta,
		velocity.y + ACCELERATION * delta + (
			-JUMP_STRENGTH * delta if is_jumping else 0))
	move_and_slide()
