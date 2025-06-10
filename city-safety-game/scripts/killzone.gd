extends Area2D

@onready var timer: Timer = $Timer
@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	game_manager.road_alert()
	#Engine.time_scale = 0.5
	#body.get_node("CollisionShape2D").queue_free()
	#timer.start()


func _on_timer_timeout() -> void:
	#PASS
	Engine.time_scale = 1.0
	#get_tree().reload_current_scene()
