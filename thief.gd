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

func _on_Area2D_area_entered(area):
	pass # Replace with function body.
	
func die():
	get_node("look").animation = "dead"
	get_node("dead_time").start()

func _on_dead_time_timeout():
	queue_free()
