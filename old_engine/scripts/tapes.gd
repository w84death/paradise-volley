extends Spatial

const FLOOR_LEFT = 2
const FLOOR_RIGHT = 3

func _ready():
	add_to_group("tapes")

func blink(floor_id):
	if floor_id == FLOOR_LEFT:
		get_node("anim").play("blink_red")
	if floor_id == FLOOR_RIGHT:
		get_node("anim").play("blink_blue")