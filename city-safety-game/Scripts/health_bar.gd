extends Area2D

var health := 9
const MAX_HEALTH := 15
const MIN_HEALTH := 0
@onready var health_bar := $HealthBar

func _ready():
	update_health_bar()

func apply_health_change(amount: int):
	if (health + amount <= MAX_HEALTH):
		health += amount
		update_health_bar()
		
		if (health <= MIN_HEALTH):
			die()
	

func update_health_bar():
	health_bar.play("default")
	health_bar.frame = health
