extends Node

@onready var music_player := AudioStreamPlayer.new()

func _ready():
	music_player.autoplay = true
	add_child(music_player)
	music_player.volume_db = -10
	var stream = preload("res://assets/sounds/best-game-console-301284.mp3")
	stream.loop = true
	music_player.stream = stream
	music_player.play()
