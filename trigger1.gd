extends Area2D
var boar = preload("res://Boar.tscn")
var Boar

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var triggered = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Trigger_body_entered(body):
	if body.name == "Player" and !triggered:
		Boar = boar.instance()
		Boar.position = Vector2(260, 64)
		Boar.get_node("Boar").play()
		get_parent().add_child(Boar)
		triggered = true
		
	
	 # Replace with function body.
