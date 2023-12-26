extends Area2D

const VELOCITY = 1500
var is_rightwards

const DAMAGE = 5


func set_parameters(is_rightwards, position):
	self.is_rightwards = is_rightwards
	self.position = position
	if not is_rightwards:
		$AnimatedSprite2D.scale.x = -$AnimatedSprite2D.scale.x


func _physics_process(delta):
	position += Vector2(
		VELOCITY * delta * (1 if is_rightwards else -1),
		0)


func _on_body_entered(body):
	body.take_damage(DAMAGE)
