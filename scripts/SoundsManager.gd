extends Node

onready var sounds = [
	{
		"id": 1,
		"name": "click",
		"sound": preload("res://assets/sounds/click_fx.wav")
	},
	{
		"id": 2,
		"name": "photo_click",
		"sound": preload("res://assets/sounds/click_fondo_calendario.wav")
	},
	{
		"id": 3,
		"name": "photo_news",
		"sound": preload("res://assets/sounds/click_noticia.wav")
	},
	{
		"id": 4,
		"name": "game_over_start",
		"sound": preload("res://assets/sounds/gameover_fx_start.wav")
	},
	{
		"id": 5,
		"name": "game_over_fx",
		"sound": preload("res://assets/sounds/gameover_fx.wav")
	},
	{
		"id": 6,
		"name": "heartbeat",
		"sound": preload("res://assets/sounds/heartbeat_fx.wav")
	},
	{
		"id": 7,
		"name": "acierto",
		"sound": preload("res://assets/sounds/click_acierto.wav")
	},
]

func get_sound(key):
	for snd in sounds:
		if snd.name == key:
			return snd.sound
	return false
