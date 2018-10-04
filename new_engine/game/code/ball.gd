extends RigidBody

export var type = 1
var on_floor = false
var jump_speed = 2500
var velocity = Vector3(0,0,0)
const FLOOR_LEFT = 2
const FLOOR_RIGHT = 3
const PLAYER = 0
const NEUTRAL = 4

var ball_sfx = [] 
onready var ball_player = get_node("ball_player")

func _ready():
	ball_sfx.append(load("res://game/sound/sfx/ball_01.wav"))
	ball_sfx.append(load("res://game/sound/sfx/ball_02.wav"))
	ball_sfx.append(load("res://game/sound/sfx/ball_03.wav"))
	ball_sfx.append(load("res://game/sound/sfx/ball_04.wav"))
	ball_sfx.append(load("res://game/sound/sfx/ball_05.wav"))
	pass

func _physics_process(delta):
	
	is_on_floor()
	is_colliding()
	
	if on_floor:
		#ball_player.stream = ball_sfx
		#ball_player.play()
		
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
	
func is_colliding():
	if not get_colliding_bodies().empty():
		play_sfx()
			
func play_sfx():
	if ball_player.is_playing():
		return
	randomize()
	var no = randi()%ball_sfx.size()
	ball_player.stream = ball_sfx[no]
	ball_player.play()