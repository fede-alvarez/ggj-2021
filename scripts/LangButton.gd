extends LinkButton

var options_open = false

signal language_changed

func _ready():
	hide_options()

func _on_LangButton_pressed():
	options_open = !options_open
	
	if options_open:
		show_options()
	else:
		hide_options()

func show_options():
	for lang in get_children():
		lang.visible = true
		
func hide_options():
	for lang in get_children():
		lang.visible = false

func _on_Spanish_pressed():
	TranslationServer.set_locale("es")
	hide_options()
	emit_signal("language_changed")

func _on_English_pressed():
	TranslationServer.set_locale("en")
	hide_options()
	emit_signal("language_changed")
