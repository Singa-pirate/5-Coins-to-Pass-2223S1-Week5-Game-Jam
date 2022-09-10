extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_pause_timeout():
	get_node("grow").play("grow")


func _on_Touchbox_body_entered(body):
	if body.name == "Player":
		get_node("fall").play("fall")
		get_node("pause").start()
		get_node("dead").start()


func _on_Killbox_body_entered(body):
	if body.name == "Player" or body.name == "thief2":
		get_node("AnimatedSprite").modulate = Color(1, 0.5, 0.5)
		body.die()


func _on_dead_timeout():
	queue_free()
