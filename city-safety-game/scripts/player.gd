extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var idle_direction: Vector2 = Vector2(1,0)
var speed: int = 100
@onready var player: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("walking_left", "walking_right", "walking_up", "walking_down")
	velocity = direction * speed
	move_and_slide()
	
	if direction.length() > 0: 
		idle_direction = direction
		play_walking_animation(direction)
	else: 
		play_idle_animation(direction)
	
func play_walking_animation(direction): 
	if direction.x > 0: 
		player.play("walking_right")
	elif direction.x < 0: 
		player.play("walking_left")
	elif direction.y < 0: 
		player.play("walking_up")
	elif direction.y > 0: 
		player.play("walking_down")

func play_idle_animation(direction): 
	if idle_direction.x > 0: 
		player.play("idle_right")
	elif idle_direction.x < 0: 
		player.play("idle_left")
	elif idle_direction.y < 0: 
		player.play("idle_up")
	elif idle_direction.y > 0: 
		player.play("idle_down")
		
		
func bump_back(from_direction: Vector2):
	var bump_force = 20  
	position += from_direction.normalized() * bump_force
