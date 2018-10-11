extends Spatial

func set_score(score):
	var height = 0 - (7 - score)
	$core.set_translation(Vector3(0, height,0))