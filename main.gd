extends Node

@export var ball_spawn: PackedScene

var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$Paddle.position = Vector2(1144, 378)
	$Paddle2.position = Vector2(136, 378)
	$Paddle/AnimatedSprite2D.play("paddle_1")
	$Paddle2/AnimatedSprite2D.play("paddle_2")
	
	var dir = ["left", "right"].pick_random()
	
	_respawn(dir)
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direc_right = 0
	var direc_left = 0
	
	if Input.is_action_pressed("move_up_right_player"):
		direc_right -= 1
	if Input.is_action_pressed("move_down_right_player"):
		direc_right += 1
		
	if Input.is_action_pressed("move_up_left_player"):
		direc_left -= 1
	if Input.is_action_pressed("move_down_left_player"):
		direc_left += 1	
		
	var velocity_vec_right = Vector2(0, direc_right) * speed * delta
	$Paddle.position = $Paddle.position + velocity_vec_right
	
	var velocity_vec_left = Vector2(0, direc_left) * speed * delta
	$Paddle2.position = $Paddle2.position + velocity_vec_left
	

func _respawn(dir):
	var ball = ball_spawn.instantiate()
	
	var ball_spawn_location = $Path2D/PathFollow2D
	ball_spawn_location.progress_ratio = randf()
	
	ball.position = ball_spawn_location.position
	
	var direction = ball_spawn_location
	#var direction = ball_spawn_location.rotation - PI/2
	
	# Add some randomness to the direction.
	
	if dir == "right":
		direction = ball_spawn_location.rotation - PI/2
		#print(direction)
		#pass
	else:
		direction = ball_spawn_location.rotation + PI/2
		#print(direction)
		#pass	
	
	direction += randf_range(-PI / 3, PI / 3)
	ball.rotation = direction
	
	# Choose the velocity for the mob.
	var velocity = Vector2(700, 0.0)
	ball.velocity = velocity.rotated(direction)
	
	#print(direction)
	
	add_child(ball)



func _on_ball_hit_right() -> void:
	#print("gotta respawn")
	var dir = "right"
	_respawn(dir) 



func _on_ball_hit_left() -> void:
	#print("gotta respawn")
	var dir = "left"
	_respawn(dir) 
