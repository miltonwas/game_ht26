extends Node2D

@export var bpm: float = 120.0
@export var hit_window: float = 0.15

var beat_interval: float
var start_time: float
var last_beat_count: int = 0

func _ready():
	beat_interval = 60.0 / bpm
	start_time = Time.get_ticks_msec() / 1000.0

func _process(_delta):
	var t = Time.get_ticks_msec() / 1000.0 - start_time
	var current_beat_count = int(t / beat_interval)

	if current_beat_count > last_beat_count:
		last_beat_count = current_beat_count
		$AnimatedSprite2D.set_frame_and_progress(0,0)
	else:
		$AnimatedSprite2D.set_frame_and_progress(1,1)
		
func _input(event):
	if event.is_action_pressed("right"):
		var t = Time.get_ticks_msec() / 1000.0 - start_time
		var nearest_beat = round(t / beat_interval) * beat_interval
		var diff = abs(t - nearest_beat)

		if diff <= hit_window:
			print("Träff!")
		else:
			print("Miss")
