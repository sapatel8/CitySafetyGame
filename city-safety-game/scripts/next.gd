extends Area2D

const FILE_BEGIN = "res://scenes/level"
const FILE_END = ".tscn"
var next_level_number = 0

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"): 
		print("collided with player")
		var current_scene_file = get_tree().current_scene.scene_file_path
		print(current_scene_file)
		if (current_scene_file == "res://scenes/main.tscn"): 
			next_level_number = 1
		else: 
			# Convert name of scene into its integer number only, then add 1
			next_level_number = current_scene_file.to_int() + 1
		print(next_level_number)
		
		if next_level_number == 5: 
			get_tree().change_scene_to_file("res://scenes/endScreen.tscn")
		else: 
			# Create path using new level number
			var next_level_path = FILE_BEGIN + str(next_level_number) + FILE_END
			print(next_level_path)
			get_tree().change_scene_to_file(next_level_path)
		
		
