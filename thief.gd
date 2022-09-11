extends KinematicBody2D

var SPEED = 15
var is_slow_down = false
var velocity = Vector2.ZERO
var direction = 1
var coin = preload("res://Coin.tscn")

func _ready():
	if name == "thief2":
		get_node("look").animation = "idle"
		SPEED = 0
		
func _physics_process(delta):
	if get_parent().get_node("Player").coin_count == 3:
		SPEED = 15
		get_node("look").animation = "run"	
	velocity.x = SPEED * direction
	velocity.y += 8
	move_and_slide(velocity, Vector2.UP)
	if is_on_wall():
		direction = - direction
	if is_slow_down:
		SPEED = lerp(SPEED, 0, 0.05)
	
	if direction == 1:
		get_node("look").set_flip_h(false)
	else:
		
		get_node("look").set_flip_h(true)
	
	if is_on_floor():
		velocity.y = 0
	
func die():
	is_slow_down = true
	get_node("look").animation = "dead"
	get_node("dead_time").start()

func _on_dead_time_timeout():
	var Coin = coin.instance()
	Coin.position = position + Vector2(10 * direction, 0)
	Coin.scale = Vector2(0.5, 0.5)
	get_parent().add_child(Coin)
	queue_free()
	

func jump():
	velocity.y = -100
