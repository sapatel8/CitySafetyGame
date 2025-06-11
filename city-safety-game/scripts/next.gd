extends Area2D

# Use for simplifying path creation 
const FILE_BEGIN = "res://scenes/level"
const FILE_END = ".tscn"
var next_level_number = 0

func _on_body_entered(body: Node2D) -> void:
	# If the trophy has collided with the player 
	if body.is_in_group("Player"): 
		print("collided with player")
		
		# Get the current scene so can use it to move to the next ont
		var current_scene_file = get_tree().current_scene.scene_file_path
		print(current_scene_file)
		
		# If currently on the main scene, want to switch to the first level
		if (current_scene_file == "res://scenes/main.tscn"): 
			next_level_number = 1
		# If on any other level, can keep increasing level 
		else: 
			# Convert name of scene into its integer number only, then add 1
			next_level_number = current_scene_file.to_int() + 1
		print(next_level_number)
		
		# If on the last level, level4, then next scene is ending scene
		if (next_level_number == 5): 
			get_tree().change_scene_to_file("res://scenes/endScreen.tscn")
		# If on any other level, can switch to next level scene
		else: 
			# Create path using new level number
			var next_level_path = FILE_BEGIN + str(next_level_number) + FILE_END
			print(next_level_path)
			get_tree().change_scene_to_file(next_level_path)
		
		
