extends Node

onready var list = [$a1,$a2,$a3,$a4]

func click():
	list[randi()%list.size()-1].play()
