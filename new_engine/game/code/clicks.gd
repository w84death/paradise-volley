extends Panel

# Declare member variables here. Examples:
# var a = 2
# var "res://game/sound/buttons1.ogg"b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


onready var list = [$a1,$a2,$a3,$a4]


func _on_Button_button_down():
	$button_audio.click()
