extends Node

var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Paddle.position = Vector2(1144, 378)
	$Paddle2.position = Vector2(136, 378)
	$Paddle/AnimatedSprite2D.play("paddle_1")
	$Paddle2/AnimatedSprite2D.play("paddle_2")
	
	

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
		
