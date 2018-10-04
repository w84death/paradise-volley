var path = load("res://game/sound/sfx/ball.wav")
var extension = "wav"

var samples = {}
var audio_stream_player

func _init():
	audio_stream_player = AudioStreamPlayer.new()
	audio_stream_player.set_bus("sfx_bus")
	audio_stream_player.set_volume_db(0)
	audio_stream_player.set_mix_target(0)
	audio_stream_player.set_autoplay(1)
	load_samples()

	
func play_sfx(name):
	audio_stream_player.stop()
	audio_stream_player.stream = samples[name]
	audio_stream_player.play()
	
	
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
