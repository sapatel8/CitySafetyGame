extends Node
#
#var score;
var paused = false
#var current_level := -1
#var level = 0


@onready var score_label: Label = %"score label"
@onready var alert: Label = %alert
@onready var pause_menu: Control = %PauseMenu
@onready var timer: Timer = %Timer

func _ready() -> void:
	if Global.score == 0:
		score_label.text = "0 points"
	elif Global.score == 1:
		score_label.text = str(Global.score) + " point"
	elif Global.score > 1:
		score_label.text = str(Global.score) + " points"

func add_point(): 
	Global.score += 1
	if (Global.score <= 1):
		score_label.text = str(Global.score) + " point"
	else:
		score_label.text = str(Global.score) + " points"

func stranger_alert():
	timer.start()
	alert.text += "Be careful of strangers!!\n"
	
	
func car_alert():
	timer.start()
	alert.text += "Watch for cars!!\n"
	Global.carHit += 1
	
func road_alert():
	timer.start()
	#while !timer.is_stopped():
	alert.text += "Dont go into the road!!\n"
	Global.road += 1
	
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
