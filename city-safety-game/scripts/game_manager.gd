extends Node

var score = 0
@onready var timer: Timer = %Timer
@onready var score_label: Label = %scoreLabel
@onready var alert: Label = %Alert

func add_point(): 
	score += 1
	if (score <= 1):
		score_label.text = str(score) + " point"
	else:
		score_label.text = str(score) + " points"

func stranger_alert():
	timer.start()
	alert.text += "Be careful of strangers!!\n"
	
func car_alert():
	timer.start()
	alert.text += "Watch for cars!!\n"
	
func road_alert():
	timer.start()
	#while !timer.is_stopped():
	alert.text += "Dont go into the road!!\n"
	
func _on_timer_timeout() -> void:
	alert.text = ""
