extends Area2D

@export var health_effect := -1

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.apply_health_change(health_effect)
		queue_free()
