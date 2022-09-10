extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var maps = {
	"Map1": preload("res://Map1.tscn"),
	"Map2": preload("res://Map2.tscn")
	}

var current_map = maps["Map1"].instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(current_map)


func change_map(next_map):
	remove_child(current_map)
	current_map.queue_free()
	current_map = maps[next_map].instance()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
