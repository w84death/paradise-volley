extends Position3D

const FLOOR_LEFT = 2
const FLOOR_RIGHT = 3
const NEUTRAL = 4
const MAX_SCORE = 7
var score = [MAX_SCORE, MAX_SCORE]

func _ready():
	add_to_group("scores")
	ProjectSettings.set_setting('game_max_score', MAX_SCORE)

func set_score(type):
	if type == FLOOR_LEFT:
		score[1] -= 1
		$red.set_score(score[1])
	if type == FLOOR_RIGHT:
		score[0] -= 1
		$blue.set_score(score[0])
	
	if score[0] <= 0 or score[1] <= 0:
		if score[0] > 0:
			ProjectSettings.set_setting('winner', 0)
		if score[1] > 0:
			ProjectSettings.set_setting('winner', 1)
		get_tree().change_scene('game/scenes/game_over.tscn')