extends Node

onready var sounds = [
	{
		"id": 1,
		"name": "click",
		"sound": preload("res://assets/sounds/(Click FX).wav")
	},
	{
		"id": 2,
		"name": "photo_click",
		"sound": preload("res://assets/sounds/(Click en foto y calendario FX).wav")
	},
	{
		"id": 3,
		"name": "photo_news",
		"sound": preload("res://assets/sounds/(Click en noticia FX).wav")
	},
	{
		"id": 4,
		"name": "game_over_start",
		"sound": preload("res://assets/sounds/(gam over FX comienzo).wav")
	},
	{
		"id": 5,
		"name": "game_over_fx",
		"sound": preload("res://assets/sounds/(game over FX).wav")
	},
	{
		"id": 6,
		"name": "heartbeat",
		"sound": preload("res://assets/sounds/(heartbeat fx) - lee la historia o parrafo de muerte hija.wav")
	},
]

func get_sound(key):
	for snd in sounds:
		if snd.name == key:
			return snd.sound
	return false
