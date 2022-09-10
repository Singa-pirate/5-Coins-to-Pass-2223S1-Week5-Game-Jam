extends KinematicBody2D
var message = "123123"
var is_popup = 0

func _ready():
	get_node("Dialog_box").get_node("Label").text = message

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_down"):
		if not is_popup:
			get_node("Dialog_box").popup()
			is_popup = 1
		else:
			get_node("Dialog_box").hide()
			is_popup = 0
