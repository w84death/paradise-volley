extends Spatial

export var game_mode = 0
export var game_paused = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start_game():
	game_paused = false
	$player_1.game_paused = game_paused
	$player_2.game_paused = game_paused
	
	if game_mode == 0:
		$player_2.bot = true
	
	if game_mode == 1:
		$player_1.bot = false
		$player_2.bot = false
	
	if game_mode == 2:
		$player_1.bot = true
		$player_2.bot = true