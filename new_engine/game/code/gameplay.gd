extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start_game():
	ProjectSettings.set_setting('game_paused', false)
	$player_1.game_paused = false
	$player_2.game_paused = false
	
	if ProjectSettings.get_setting('game_type') == 0:
		$player_2.bot = true
	
	if ProjectSettings.get_setting('game_type') == 1:
		$player_1.bot = false
		$player_2.bot = false
	
	if ProjectSettings.get_setting('game_type') == 2:
		$player_1.bot = true
		$player_2.bot = true