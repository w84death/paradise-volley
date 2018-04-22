extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://scenes/main_menu.tscn")