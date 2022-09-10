extends KinematicBody2D

var SPEED = 70
var is_slow_down = 0
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.x = SPEED
	#velocity.y += 8
	move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("ui_accept"):
		is_slow_down = 1
		die()
	
	if Input.is_action_just_pressed("ui_up"):
		jump()
		
	if is_slow_down:
		SPEED = lerp(SPEED, 0, 0.05)
		
	if is_on_floor():
		velocity.y = 0

func _on_Area2D_area_entered(area):
	pass # Replace with function body.
	
func die():
	get_node("look").animation = "dead"
	get_node("dead_time").start()

func _on_dead_time_timeout():
	queue_free()

func jump():
	velocity.y = -100
