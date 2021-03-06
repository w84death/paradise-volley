extends RigidBody

export var type = 1
var on_floor = false
var jump_speed = 2500
var velocity = Vector3(0,0,0)
const FLOOR_LEFT = 2
const FLOOR_RIGHT = 3
const PLAYER = 0
const NEUTRAL = 4

func _ready():
	pass

func _physics_process(delta):
	
	is_on_floor()
	if on_floor:
		get_node("anim").play("benc")
		velocity = Vector3(0, 1, 0)
		velocity = velocity.normalized() * jump_speed * delta
		set_axis_velocity(velocity)
		on_floor = false
	
func get_type():
	return type

func is_on_floor():
	var t = -1
	for cb in get_colliding_bodies():
		t = cb.get_type()
		get_tree().call_group('scores', 'set_score', t)
		if t == FLOOR_LEFT or t == FLOOR_RIGHT:
			get_tree().call_group('tapes', 'blink', t)
			on_floor = true
			return true
	return false
