extends Node2D
onready var tween = $Control/TransitionTween
onready var transition_rect = $Control/Transition
onready var audio_tween = $Control/AudioTween
onready var sound_player = $SoundsPlayer

onready var lang_button = $Control/LangButton

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	TranslationServer.set_locale("en")
	show_translated_text()
	
func show_translated_text():
	$Control/LinkButton.text = TranslationServer.translate("KEY_MENU_CREDITS").to_upper()
	$Control/LangButton.text = TranslationServer.translate("KEY_MENU_LANGS").to_upper()
	$Control/Message.text = "- " + TranslationServer.translate("KEY_MENU_TOUCH_START").to_upper() + " -"
	$Control/Warning.bbcode_text = "[center][color=yellow]< [wave amp=11 freq=5]" + TranslationServer.translate("KEY_MENU_SOUND_WARN").to_upper() + "[/wave] >[/color][/center]"
	
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	$Control/Cursor.position = Vector2(mouse_pos.x + 1.7, mouse_pos.y + 5)
	
func play_sound(snd):
	var sound = SoundsManager.get_sound(snd)
	if sound:
		sound_player.stream = sound
		sound_player.play()

func _on_IntroButton_pressed():
	play_sound("click")
	transition_rect.visible = true
	tween.interpolate_property(transition_rect, "modulate", Color(1,1,1,0), Color(1,1,1,1), 2.0, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.start()
	
	audio_tween.interpolate_property($Audio, "volume_db", 0,-80, 1.8)
	audio_tween.start()
	
	yield(tween, "tween_completed")
	get_tree().change_scene("res://scenes/Game.tscn")

func _on_LinkButton_pressed():
	play_sound("click")
	$Control/CreditosPopup.show()

func _on_CloseButton_pressed():
	play_sound("click")
	$Control/CreditosPopup.hide()

func _on_LangButton_language_changed():
	show_translated_text()
