extends Node

@onready var music_player := AudioStreamPlayer.new()

func _ready():
	music_player.autoplay = true
	add_child(music_player)
	music_player.volume_db = -10
	music_player.stream = preload("res://assets/sounds/best-game-console-301284.mp3")
	#music_player.loop = true
	music_player.play()
