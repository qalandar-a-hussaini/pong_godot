extends CharacterBody2D

var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# hard coding the intial postion of the paddle
	#position = Vector2(1144, 378)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#var direc = 0
	#if Input.is_action_pressed("move_up_right_player"):
		#direc -= 1
	#if Input.is_action_pressed("move_down_right_player"):
		#direc += 1
		#
	#var velocity_vec = Vector2(0, direc) * speed * delta
	#position = position + velocity_vec
	
func _physics_process(delta: float) -> void:
	#var direc = 0
	#if Input.is_action_pressed("move_up_right_player"):
		#direc -= 1
	#if Input.is_action_pressed("move_down_right_player"):
		#direc += 1
		
	#var velocity_vec = Vector2(0, direc) * speed * delta
	#position = position + velocity_vec
	move_and_collide(velocity * delta)
	
	
