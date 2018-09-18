extends Control

const FLOOR_LEFT = 2
const FLOOR_RIGHT = 3
const NEUTRAL = 4
export var MAX_SCORE = 10
var score = [MAX_SCORE, MAX_SCORE]
onready var score_left = get_node("left")
onready var score_right = get_node("right")

func _ready():
	add_to_group("scores")

func set_score(type):
	if type == FLOOR_LEFT:
		score[1] -= 1
	if type == FLOOR_RIGHT:
		score[0] -= 1
	score_left.set_value(score[0])
	score_right.set_value(score[1])
	
	if score[0] < 0 or score[1] < 0:
		if score[0] > 0:
			ProjectSettings.set_setting('winner', 0)
		if score[1] > 0:
			ProjectSettings.set_setting('winner', 1)
		get_tree().change_scene("res://scenes/game_over.tscn")