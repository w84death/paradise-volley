extends Spatial


func _ready():
	if ProjectSettings.get_setting('winner') == 0:
		$GUI/scoreboard/winner.set_text('BLUE PLAYER WINS!')
		$anim.play("blue_win")
	else:
		$GUI/scoreboard/winner.set_text('RED PLAYER WINS!')
		$anim.play("red_win")
	$GUI/panel/menu/restart.grab_focus()

func _on_restart_pressed():
	get_tree().change_scene('game/scenes/game.tscn')

func _on_menu_pressed():
	ProjectSettings.set_setting('force_menu', true)
	get_tree().change_scene('game/scenes/lobby.tscn')
