extends CharacterBody2D

func _ready() -> void:
	var dir = Vector2(5,-4).normalized()
	velocity = dir * 400
	
func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		move_and_collide(reflect)
