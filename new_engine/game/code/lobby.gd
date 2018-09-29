extends Control

func _ready():
	pass


# >> QUIT <<

func _on_quit_pressed():
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
	$center/welcome.hide()
	$world/director.play("menu")
	

func _on_show_settings_pressed():
	$center/settings.show()
	$center/settings/group/graphics/setting.grab_focus()


func _on_settings_to_menu_pressed():
	$center/settings.hide()
	$center/menu/group/show_settings.grab_focus()


func _on_practice_to_menu_pressed():
	$center/practice.hide()
	$center/menu/group/show_practice.grab_focus()


func _on_show_practice_pressed():
	$center/practice.show()
	$center/practice/group/group/menu/play_practice.grab_focus()


func _on_credits_to_menu_pressed():
	$center/credits.hide()
	$center/menu/group/show_credits.grab_focus()


func _on_show_credits_pressed():
	$center/credits.show()
	$center/credits/group/group/credits_to_menu.grab_focus()


func _on_play_practice_pressed():
	get_tree().change_scene('game/scenes/game.tscn')
