extends KinematicBody2D

var input_vector #a vector to store the input from the user
var velocity = Vector2(0, 0)
var MOVEMENT_SPEED = 100
var FRICTION = 0.3
var jumps_remaining = 1
var JUMP_SPEED = 200
var coin_count = 0
var gravity = 9.81

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().name == "Map2":
		MOVEMENT_SPEED /= 2
		JUMP_SPEED /= 1.75
		gravity /= 2
		FRICTION /= 2

func _physics_process(_delta):
	input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if is_on_floor():
		jumps_remaining = 1
	
	if Input.is_action_just_pressed("ui_up") and jumps_remaining > 0:
		velocity.y -= JUMP_SPEED
		jumps_remaining -= 1

	velocity.y += gravity #apply gravity
	input_vector.normalized() #makes the input_vector always have a magnitude of 1

	velocity.x = lerp(velocity.x, input_vector.x * MOVEMENT_SPEED, FRICTION) #linearly interpolates the current velocity towards the input_vector
	velocity = move_and_slide(velocity, Vector2.UP) #A built-in function that makes the kinematic body move at that velocity. Velocity is set to 0 when not moving.
	
	if coin_count == 5:
		get_parent().get_node("door").is_open = 1

func die():
	get_tree().quit()
