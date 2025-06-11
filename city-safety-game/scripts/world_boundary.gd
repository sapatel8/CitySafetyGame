extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"): 
		body.bump_back(-(global_position.direction_to(body.global_position)))
