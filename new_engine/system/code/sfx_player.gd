extends AudioStreamPlayer

var path = load("res://game/sound/sfx/ball.wav")
var extension = "wav"

var samples = {}

func _ready():
	self.load_samples()
	self.play_sfx("ball")
	
	pass # Replace with function body.
	
func play_sfx(name):
	stream = self.samples[name]
	play()
	
func load_samples():
	var dir = Directory.new()
	if dir.open("res://game/sound/sfx") == OK:
		dir.list_dir_begin()
		var file = dir.get_next()
		while (file != ""):
			if file.ends_with("wav") or file.ends_with("ogg"):
				self.add_sample(file)
			file = dir.get_next()
			
func add_sample(file_name):
	var sample_name = file_name.split(".")[0]
	self.samples[sample_name] = load("res://game/sound/sfx/" + file_name)	
