extends Control

#@onready var GameManager: Node = $"../GameManager"

func _on_start_button_pressed() -> void:
	#GameManager.start_level(0)
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_option_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options_screen.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
