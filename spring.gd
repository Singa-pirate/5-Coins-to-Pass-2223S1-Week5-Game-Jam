extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const BIU_SPEED = -200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func _on_Touchbox_area_entered(area):
	print(area.name)
	if area.name == "Hitbox":
		get_parent().get_child(0).velocity = Vector2(0, BIU_SPEED)

