extends KinematicBody2D


var velocity = Vector2(0,0)
var input_vector
const GRAVITY = 0.8
const JUMPING_VELOCITY = -15
const SPEED = 3
const FRICTION = 0.5
var count =0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	input_vector = Vector2(0,0)
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity.x = lerp(velocity.x, input_vector.x * SPEED, FRICTION)
	velocity.y = lerp(velocity.y, input_vector.y * SPEED, FRICTION)
	
	move_and_slide(velocity * 10)
	
	
	
	
	
