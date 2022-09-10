extends KinematicBody2D

var velocity = Vector2.ZERO
var is_fade = 0

func _physics_process(delta):
	move_and_slide(velocity, Vector2.UP)	
	
		

func _on_Area2D_area_entered(area):
	pass # Replace with function body.
	
func die():
	velocity.y = -100
	is_fade = 1
	get_node("dead_time").start()

func _on_dead_time_timeout():
	queue_free()
