extends StaticBody2D
var is_open = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _on_door_box_body_entered(body):
	if body.name == "Player" and is_open:
		get_parent().get_parent().change_map("Map2")
		get_parent().queue_free()
