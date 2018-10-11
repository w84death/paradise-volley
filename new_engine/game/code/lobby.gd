extends Control

func _ready():
	if ProjectSettings.get_setting('force_menu'):
		$world/director.play('menu')


# >> QUIT <<

func _on_quit_pressed():
	$audio_ui.click()
	get_tree().quit()

func _on_menu_modal_closed():
	get_tree().quit()
	
func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


# >> MENUS <<

func popup_welcome():
	$center/welcome.show()
	$center/welcome/group/group/menu/show_menu.grab_focus()
	
func popup_menu():
	$center/menu.show()
	$center/menu/group/show_practice.grab_focus()
	

func _on_show_menu_pressed():
	$audio_ui.click()
	$center/welcome.hide()
	$world/director.play("menu")
	

func _on_show_settings_pressed():
	$audio_ui.click()
	$center/settings.show()
	$center/settings/group/graphics/setting.grab_focus()


func _on_settings_to_menu_pressed():
	$audio_ui.click()
	$center/settings.hide()
	$center/menu/group/show_settings.grab_focus()


func _on_practice_to_menu_pressed():
	$audio_ui.click()
	$center/practice.hide()
	$center/menu/group/show_practice.grab_focus()


func _on_show_practice_pressed():
	$audio_ui.click()
	$center/practice.show()
	$center/practice/group/group/menu/play_practice.grab_focus()


func _on_credits_to_menu_pressed():
	$audio_ui.click()
	$center/credits.hide()
	$center/menu/group/show_credits.grab_focus()


func _on_show_credits_pressed():
	$audio_ui.click()
	$center/credits.show()
	$center/credits/group/group/credits_to_menu.grab_focus()


func _on_play_practice_pressed():
	$audio_ui.click()
	ProjectSettings.set_setting('game_type', 0)
	get_tree().change_scene('game/scenes/game.tscn')


func _on_duel_pressed():
	$audio_ui.click()
	ProjectSettings.set_setting('game_type', 1)
	get_tree().change_scene('game/scenes/game.tscn')

