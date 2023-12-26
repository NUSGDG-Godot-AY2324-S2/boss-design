extends CharacterBody2D

const ACCELERATION = 85
const HORIZONTAL_SPEED = 500
const JUMP_STRENGTH = 1500

var is_rightwards = true

const Bullet = preload("res://player/abilities/bullet.tscn")
var is_attacking = false

const MAX_HEALTH = 100
var health = MAX_HEALTH
var is_taking_damage = false


func _physics_process(delta):
	make_movement()
	attack()


func make_movement():
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var is_jumping = (Input.is_action_just_pressed("ui_up")
		or Input.is_action_just_pressed("jump")) and is_on_floor()
	adjust_animation(direction)
	
	velocity = Vector2(
		direction * HORIZONTAL_SPEED,
		velocity.y + ACCELERATION + (
			-JUMP_STRENGTH if is_jumping else 0))
	move_and_slide()


func adjust_animation(direction):
	if direction == -1:
		$AnimatedSprite2D.scale.x = -abs($AnimatedSprite2D.scale.x)
		is_rightwards = false
	elif direction == 1:
		$AnimatedSprite2D.scale.x = abs($AnimatedSprite2D.scale.x)
		is_rightwards = true


func attack():
	if not Input.is_action_just_pressed("attack") or is_attacking:
		return
	is_attacking = true
	$AttackTimer.start()
	var bullet = Bullet.instantiate()
	bullet.set_parameters(is_rightwards, position)
	get_parent().add_child(bullet)


func _on_attack_timer_timeout():
	is_attacking = false


func take_damage(damage):
	if is_taking_damage:
		return
	is_taking_damage = true
	health -= damage
	if health < 0:
		die()
		return
	get_parent().update_player_healthbar(health)
	$DamageTimer.start()
	$AnimatedSprite2D.play("taking_damage")


func _on_damage_timer_timeout():
	is_taking_damage = false
	$AnimatedSprite2D.play("idle")


func die():
	queue_free()
