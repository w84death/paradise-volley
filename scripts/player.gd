extends RigidBody

var trusters = Vector3(0,0,0)
var speed = 600

export var player_id = 0
var left_button = [KEY_LEFT, KEY_A]
var right_button = [KEY_RIGHT, KEY_D]
var jump_button = [KEY_UP, KEY_W]

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_process_input(true)
	
func _process(delta):
	if Input.is_key_pressed(jump_button[player_id]):
		set_axis_velocity(Vector3(0, speed*2*delta, 0 ))
		
	if Input.is_key_pressed(left_button[player_id]):
		apply_impulse(Vector3(0,0,0), Vector3(speed*delta, 0, 0))
	if Input.is_key_pressed(right_button[player_id]):
		apply_impulse(Vector3(0,0,0), Vector3(-speed*delta, 0, 0))
		
	
	
func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
