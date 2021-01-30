extends Node

onready var music_list = [
	{
		"id": 1,
		"name": "recuerdos",
		"sound": preload("res://assets/music/(Recuerdos song) - Cuando da click en la foto y en el calendario.ogg")
	},
	{
		"id": 2,
		"name": "vuelve_suenio",
		"sound": preload("res://assets/music/vuelve_al_suenio.ogg")
	},
]

func get_music(key):
	for msc in music_list:
		if msc.name == key:
			return msc.sound
	return false
