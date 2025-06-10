extends Area2D

var current_health := 9
const MAX_HEALTH := 15
const MIN_HEALTH := 0

@onready var health_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	update_sprite(current_health)

func set_health(amount: int):
		update_sprite(amount)

func update_sprite(value: int):
	health_sprite.play("default")
	#health_sprite.frame = current_health
	health_sprite.frame = clamp(value, MIN_HEALTH, MAX_HEALTH)
	health_sprite.stop()
