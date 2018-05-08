extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process_input(true)

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()