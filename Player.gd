extends KinematicBody2D

var input_vector #a vector to store the input from the user
var velocity = Vector2(0, 0)
var MOVEMENT_SPEED = 100
var FRICTION = 0.3
var jumps_remaining = 1
var JUMP_SPEED = 200
var coin_count = 0
var gravity = 9.81
var is_dead = false
var played = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().name == "Map2":
		MOVEMENT_SPEED /= 2
		JUMP_SPEED /= 1.75
		gravity /= 2
		FRICTION /= 2
		get_node("Camera2D").zoom = Vector2(0.125, 0.125)

func _physics_process(_delta):
	if is_dead:
		if Input.is_action_just_pressed("ui_end"):
			get_tree().quit()
		elif Input.is_action_just_pressed("ui_restart"):
			get_parent().get_parent().restart(get_parent().name)	
		return
	
	input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input_vector.x > 0:
		get_node("AnimatedSprite").set_flip_h(false)
	elif input_vector.x < 0:
		get_node("AnimatedSprite").set_flip_h(true)
	
	if is_on_floor():
		jumps_remaining = 1
	else:
		jumps_remaining = 0
	
	if Input.is_action_just_pressed("ui_up") and jumps_remaining > 0:
		get_node("Jump").play()
		velocity.y -= JUMP_SPEED
		jumps_remaining -= 1

	input_vector.normalized() #makes the input_vector always have a magnitude of 1
	
	velocity.y += gravity #apply gravity
	velocity.x = lerp(velocity.x, input_vector.x * MOVEMENT_SPEED, FRICTION) #linearly interpolates the current velocity towards the input_vector
	velocity = move_and_slide(velocity, Vector2.UP) #A built-in function that makes the kinematic body move at that velocity. Velocity is set to 0 when not moving.
	
	if coin_count == 5 && not played:
		get_node("Unlock").play()
		get_parent().get_node("door").is_open = 1
		played = true
	
	if Input.is_action_just_pressed("ui_cancel"):
		die()
		

func die():
	get_node("AnimatedSprite").animation = "dead"
	is_dead = true
