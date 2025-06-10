extends Node

var score = 0
@onready var timer: Timer = %Timer
@onready var score_label: Label = %scoreLabel
@onready var alert: Label = %Alert
@onready var camera_2d: Camera2D = $Player/Camera2D

var paused = false

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

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
