extends Spatial


func _ready():
	$reference/hamster_anim.seek(randf()*$reference/hamster_anim.current_animation_length)
	pass # Replace with function body.
