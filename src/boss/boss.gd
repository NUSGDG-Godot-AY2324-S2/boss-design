extends CharacterBody2D

const MAX_HEALTH = 100
var health = MAX_HEALTH
var is_taking_damage = false


func take_damage(damage):
	if is_taking_damage:
		return
	is_taking_damage = true
	health -= damage
	if health < 0:
		die()
		return
	get_parent().update_boss_healthbar(health)
	$DamageTimer.start()
	$AnimatedSprite2D.play("taking_damage")


func _on_damage_timer_timeout():
	is_taking_damage = false
	$AnimatedSprite2D.play("idle")


func die():
	queue_free()
