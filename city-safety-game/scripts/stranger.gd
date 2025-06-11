extends Area2D

var speed: int = 100
var previous_position: Vector2
var direction: Vector2 = Vector2.ZERO
var idle_direction: Vector2 = Vector2.RIGHT
@onready var stranger: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	print("Stranger Danger!")
	game_manager.stranger_alert()

func _ready():
	previous_position = position

func _physics_process(delta: float) -> void:
	# Detect actual movement direction based on position delta
	var movement = position - previous_position

	if movement.length() > 0:
		direction = movement.normalized()
		idle_direction = direction
		play_walking_animation(direction)
	else:
		play_idle_animation(idle_direction)

	previous_position = position  # Update for next frame

func play_walking_animation(dir: Vector2) -> void:
	# If horizontal movement of character is dominant
	if abs(dir.x) > abs(dir.y):
		# If character is moving right
		if dir.x > 0:
			stranger.play("walking_right")
		# If character is moving left
		else:
			stranger.play("walking_left")
	# If vertical movement of character is dominant
	else:
		# If character is moving upwards
		if dir.y < 0:
			stranger.play("walking_up")
		# If character is moving downwards
		else:
			stranger.play("walking_down")

func play_idle_animation(dir: Vector2) -> void:
	# If horizontal movement of character is dominant
	if abs(dir.x) > abs(dir.y):
		# If character is moving right
		if dir.x > 0:
			stranger.play("idle_right")
		# If character is moving left
		else:
			stranger.play("idle_left")
	# If vertical movement of character is dominant
	else:
		# If character is moving upwards
		if dir.y < 0:
			stranger.play("idle_up")
		# If character is moving downwards
		else:
			stranger.play("idle_down")
