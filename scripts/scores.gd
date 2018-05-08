extends Control

const FLOOR_LEFT = 2
const FLOOR_RIGHT = 3
const NEUTRAL = 4
var score = [0,0]
onready var score_left = get_node("labels/left")
onready var score_right = get_node("labels/right")

func _ready():
	add_to_group("scores")

func set_score(type):
	if type == FLOOR_LEFT:
		score[1] += 1
	if type == FLOOR_RIGHT:
		score[0] += 1
	score_left.set_text(str(score[0]))
	score_right.set_text(str(score[1]))
	#print(type, score)