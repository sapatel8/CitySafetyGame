extends Control

@onready var gameManager: Node = $"../../../Game Manager"

func _on_resume_pressed() -> void:
	gameManager.pauseMenu()


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/control.tscn")
