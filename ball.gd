extends CharacterBody2D

signal hit_right 
signal hit_left

var score_right = 0
var score_left = 0
	
func _ready() -> void:
	#var direction = Vector2(1,0).normalized()
	#velocity = direction * 600
	pass
	

	
func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		move_and_collide(reflect)
		



func _on_area_2d_body_entered(_body: Node2D) -> void:
	score_right += 1
	print(score_right)
	emit_signal("hit_right")
	
	


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	score_left += 1
	print(score_left)
	emit_signal("hit_left")
