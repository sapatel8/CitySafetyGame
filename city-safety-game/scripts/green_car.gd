extends Area2D

var speed: int = 100
var previous_position: Vector2
var direction: Vector2 = Vector2.ZERO
var idle_direction: Vector2 = Vector2.RIGHT

@onready var green_car: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("Watch for cars! (green)")
	game_manager.car_alert()
	audio.play()
	body.bump_back(global_position.direction_to(body.global_position))
	animation_player.pause()
	timer.start()

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
			green_car.play("right")
		# If character is moving left
		else:
			green_car.play("left")
	# If vertical movement of character is dominant
	else:
		# If character is moving upwards
		if dir.y < 0:
			green_car.play("up")
		# If character is moving downwards
		else:
			green_car.play("down")

func play_idle_animation(dir: Vector2) -> void:
	# If horizontal movement of character is dominant
	if abs(dir.x) > abs(dir.y):
		# If character is moving right
		if dir.x > 0:
			green_car.play("right")
		# If character is moving left
		else:
			green_car.play("left")
	# If vertical movement of character is dominant
	else:
		# If character is moving upwards
		if dir.y < 0:
			green_car.play("up")
		# If character is moving downwards
		else:
			green_car.play("down")


func _on_timer_timeout() -> void:
	animation_player.play()
