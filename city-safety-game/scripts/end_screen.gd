extends Control

@onready var stats: Label = $Stats

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/control.tscn")
	
func _ready() -> void:
	stats.text = "You collected " + str(Global.score) + " out of 60 apples.
					A car almost hit you " + str(Global.carHit) + " times.
					You unsafely crossed the road "+ str(Global.road) + " times!"
