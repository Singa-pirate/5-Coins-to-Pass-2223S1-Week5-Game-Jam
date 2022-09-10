extends KinematicBody2D

var velocity = Vector2.ZERO
var collected = false

func _physics_process(delta):
	move_and_slide(velocity, Vector2.UP)	
		
func _on_coin_box_body_entered(body):
	if (body.name == "Player" or body.name == "thief" or body.name == "thief2") and not collected:
		die()
		collected = true
		if body.name == "Player":
			get_parent().get_node("Player").coin_count += 1
		
	
func die():
	velocity.y = -100
	get_node("fade").play("fade")
	get_node("dead_time").start()

func _on_dead_time_timeout():
	queue_free()



