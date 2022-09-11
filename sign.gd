extends KinematicBody2D


func _ready():
	#get_node("Dialog").popup()
	if name == "sign1":
		get_node("Text").text = "Arrow keys to move. If u die, R to restart and Q to quit. "
	if name == "sign2":
		get_node("Text").text = "Collect 5 coins to unlock the door. Beware of traps!"
	if name == "sign3":
		get_node("Text").text = "Thief may steal your coins. Must outrun them."
	if name == "sign4":
		get_node("Text").text = "You may press 'o' to suicide. Only use in desperation!"
	if name == "sign5":
		get_node("Text").text = "Not all trees are good. Not all signs are good, either."
		
	


func _on_sign_box_body_entered(body):
	if body.name == "Player":
		get_node("Text").visible = true


func _on_sign_box_body_exited(body):
	if body.name == "Player":
		get_node("Text").visible = false
