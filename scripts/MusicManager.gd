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
		"sound": preload("res://assets/music/vuelve_al_suenio_song.ogg")
	},
	{
		"id": 3,
		"name": "sinopsis",
		"sound": preload("res://assets/music/sinopsis_comienzo.ogg")
	},
	{
		"id": 4,
		"name": "creditos",
		"sound": preload("res://assets/music/creditos.ogg")
	},
]

func get_music(key):
	for msc in music_list:
		if msc.name == key:
			return msc.sound
	return false
