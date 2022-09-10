extends KinematicBody2D

var SPEED = 200
var is_slow_down = 0
var velocity = Vector2.ZERO
var vx_sign = -1
var player

func _ready():
	player = get_parent().get_node("Player")

func _physics_process(delta):
	velocity.y += 8
	move_and_slide(velocity, Vector2.UP)

	
	var player_posx = player.position.x
	if player_posx > position.x:
		vx_sign = 1
		get_node("look").set_flip_h(false)
	else:
		vx_sign = -1 
		get_node("look").set_flip_h(true)
	velocity.x = lerp(velocity.x, vx_sign * SPEED, 0.05)
	
		
	if is_slow_down:
		SPEED = lerp(SPEED, 0, 0.05)
		
	if is_on_floor():
		velocity.y = 0

func _on_boar_box_body_entered(body):
	if body.name == "Player":
		get_parent().get_node("Player").die()
	
func die():
	get_node("look").animation = "dead"
	get_node("dead_time").start()

func _on_dead_time_timeout():
	queue_free()

func jump():
	velocity.y = -100



