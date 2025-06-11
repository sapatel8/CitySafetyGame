extends Node

var score;
var paused = false
var current_level := -1
var level = 0
@onready var timer: Timer = $Timer
#@onready var score_label: Label = %"score label"
@onready var alert: Label = %alert
@onready var pause_menu: Control = %PauseMenu
@onready var score_label: Label = $"../Player/Camera2D2/score label"

func _ready() -> void:
	if score == null:
		score_label.text = "0 points"
	elif score == 1:
		score_label.text = str(score) + " point"
	elif score > 1:
		score_label.text = str(score) + " points"

func add_point(): 
	if score == null:
		score = 1;
	else:
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
