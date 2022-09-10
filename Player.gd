extends KinematicBody2D

var input_vector #a vector to store the input from the user
var velocity = Vector2(0, 0)
const MOVEMENT_SPEED = 100
const FRICTION = 0.3
var jumps_remaining = 1
const JUMP_SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(_delta):
	input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if is_on_floor():
		jumps_remaining = 1
	
	if Input.is_action_just_pressed("ui_up") and jumps_remaining > 0:
		velocity.y -= JUMP_SPEED
		jumps_remaining -= 1

	velocity.y += 9.81 #apply gravity
	input_vector.normalized() #makes the input_vector always have a magnitude of 1

	velocity.x = lerp(velocity.x, input_vector.x * MOVEMENT_SPEED, FRICTION) #linearly interpolates the current velocity towards the input_vector
	velocity = move_and_slide(velocity, Vector2.UP) #A built-in function that makes the kinematic body move at that velocity. Velocity is set to 0 when not moving.
