extends KinematicBody2D

var velocity = Vector2.ZERO

func _physics_process(delta):
	move_and_slide(velocity, Vector2.UP)	
	
	if Input.is_action_just_pressed("ui_accept"):
		die()
		

func _on_Area2D_area_entered(area):
	pass # Replace with function body.
	
func die():
	velocity.y = -100
	get_node("fade").play("fade")
	get_node("dead_time").start()

func _on_dead_time_timeout():
	queue_free()
