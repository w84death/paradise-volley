extends RigidBody

export var type = 0
export var player_id = 0
export var bot = false

var speed = 1200
var jump_speed = 2200
var velocity = Vector3(0,0,0)
var target_velocity = Vector3(0,0,0)
var on_floor = true

const FLOOR_LEFT = 2
const FLOOR_RIGHT = 3
const OTHER_PLAYER = 0
const NEUTRAL = 4

var left_button = ["p0_left", "p1_left"]
var right_button = ["p0_right", "p1_right"]
var jump_button = ["p0_jump", "p1_jump"]

var sfx = [] 
onready var sound_player = get_node("player_player")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_process_input(true)
	if player_id == 0: get_node("red").show()
	if player_id == 1: get_node("blue").show()
	sfx.append(load("res://game/sound/sfx/jump_01.wav"))
	sfx.append(load("res://game/sound/sfx/jump_02.wav"))

func get_type():
	return type

func _physics_process(delta):
	
	if Input.is_action_pressed(right_button[player_id]) or (bot and randi()%100 < 1 ):
		velocity = Vector3(1, 0, 0)
	elif Input.is_action_pressed(left_button[player_id]) or (bot and randi()%100 < 1 ):
		velocity = Vector3(-1, 0, 0)
	else:
		velocity = Vector3(0,0,0)
	
	velocity = velocity.normalized() * speed * delta
	#apply_impulse(Vector3(0,0,0), velocity)
	set_axis_velocity(velocity)

	if on_floor and (Input.is_action_pressed(jump_button[player_id]) or (bot and randi()%100 < 1 )):
		play_jump()
		velocity = Vector3(0, 1, 0)
		velocity = velocity.normalized() * jump_speed * delta
		set_axis_velocity(velocity)
		on_floor = false
		
	is_on_floor()
	
func is_on_floor():
	var t = -1
	for cb in get_colliding_bodies():
		t = cb.get_type()
		if t == FLOOR_LEFT or t == FLOOR_RIGHT or t == OTHER_PLAYER:
			on_floor = true
			return true
	return false

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://scenes/main_menu.tscn")
		
func play_jump():
	if sound_player.is_playing():
		return
	randomize()
	sound_player.stream = sfx[player_id]
	sound_player.play()		
		
