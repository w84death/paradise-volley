extends Spatial

var active_cam = 0
onready var cams = [
	get_node("main"),
	get_node("left"),
	get_node("right"),
	get_node("top")]


func _ready():
	cams[active_cam].make_current()
	set_process_input(true)

func _input(event):
	if Input.is_action_pressed('change_camera'):
		next_camera()
		
func next_camera():
	active_cam += 1
	if active_cam >= cams.size(): active_cam = 0
	cams[active_cam].make_current()
