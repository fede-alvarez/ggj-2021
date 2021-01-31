extends Node2D

onready var news_container = $HUD/Popup/NewsContainer/VBoxContainer
onready var news_search_container = $HUD/Popup/GoogleSearch/SearchResults/ScrollResults/VBoxContainer
onready var search_text = $HUD/Popup/TxtSearch

onready var transition = $HUD/Transition
onready var transition_bg = $HUD/Transition/Background
onready var transition_tween = $HUD/Transition/TransitionTween
onready var news_detail_container = $HUD/Popup/NewsDetail

onready var popup_tween = $HUD/Popup/PopupTween

onready var sound_player = $Sounds
onready var music_tween = $MusicPlayer/MusicTween
onready var task_date = $HUD/Popup/TaskBar/Date

onready var consequences = $Consecuencias
onready var positivas = $Positivas

var empty_holder_str = 'HAZ CLICK EN LA "LUPA" DE LA NOTICIA PARA COMENZAR'

func _ready():
	$HUD/Popup/InputBorder.visible = false
	$HUD/Popup/SearcherButton.disabled = true
	$HUD/Popup/GoogleSearch/EmptyHolder.visible = true
	$HUD/Popup/GoogleSearch/SearchResults.visible = false
	news_detail_container.visible = false
	
	transition.visible = true
	
	#print(OS.get_date())
	task_date.text = Globals.get_time()
	
	for news in Globals.get_news():
		var news_entity = preload("res://entities/Noticia.tscn").instance()
		if news_entity:
			news_container.add_child(news_entity)
			
			news_entity.set_as_fake(news.is_fake)
			news_entity.set_data(news.id, news.title, news.date, news.image)
			
			news_entity.connect("search_news", self, "on_news_searched")
			news_entity.connect("fake_news_filtered", self, "on_fake_news_filtered")
			news_entity.connect("fake_news_missed", self, "on_fake_news_missed")
	
	$MusicPlayer.play()
	
	$HUD/Intro.show()
	$HUD/Intro.start()
	yield($HUD/Intro, "intro_over")
	
	# INTRO
	transition_tween.interpolate_property(transition_bg, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1.0, Tween.TRANS_QUAD, Tween.EASE_IN)
	transition_tween.start()
	yield(transition_tween, "tween_completed")
	transition.visible = false
	
	$HUD/Dialogs.show_dialog([
		"Hora de ponerse a trabajar. La ".to_upper() + colorize("inspección de internet") + ", no se va a hacer sola!".to_upper(),
		"Cuando estés listo ve a la ".to_upper() + colorize("computadora")
	])

func on_fake_news_filtered():
	#print("Fake news filtered! :D")
	Globals.add_fake_news()
	
	if Globals.fake_news == 3:
		positivas.show_random_positive()
		
	update_hud()

func on_fake_news_missed():
	#print("Fake news missed :(")
	Globals.add_error()

	if Globals.total_errors == 5:
		#print("Perdisteeeeee")
		close_popup()
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/GameOver.show()
		yield(get_tree().create_timer(3.0), "timeout")
		transition.visible = true
		transition_tween.interpolate_property(transition_bg, "modulate", Color(1,1,1,0), Color(1,1,1,1), 1.0, Tween.TRANS_QUAD, Tween.EASE_IN)
		transition_tween.start()
		yield(transition_tween, "tween_completed")
		get_tree().change_scene("res://scenes/Menu.tscn")
		
	elif Globals.total_errors == 3:
		consequences.show_random_consequence()
		
	update_hud()
		
func update_hud():
	$HUD/Popup/LblFakes.text = "FALSAS FILTRADAS " + String(Globals.fake_news) + " / 5" 
	$HUD/Popup/LblErrors.text = "ERRORES " + String(Globals.total_errors) + " / 5"
	
func get_news_by_id (news_id):
	for news in Globals.NEWS:
		if news_id == news.id:
			return news
	return null
		
func on_news_searched( id ):
	var news_detail = get_news_by_id(id)
	search_text.text = (news_detail.title).to_upper()
	$HUD/Popup/InputBorder.visible = true
	$HUD/Popup/SearcherButton.disabled = false
	
	$HUD/Popup/GoogleSearch/EmptyHolder.text = empty_holder_str
	$HUD/Popup/GoogleSearch/EmptyHolder.visible = true
	$HUD/Popup/GoogleSearch/SearchResults.visible = false
	
func play_sound(snd):
	var sound = SoundsManager.get_sound(snd)
	if sound:
		sound_player.stream = sound
		sound_player.play()

func play_music(msc):
	pause_background_music()
	# Secondary Music fade start
	$SecondaryPlayer.stream = MusicManager.get_music(msc)
	$SecondaryPlayer.play()
	music_tween.interpolate_property($SecondaryPlayer, "volume_db", -80, -10, 1.5)
	music_tween.start()

func pause_background_music():
	music_tween.interpolate_property($MusicPlayer, "volume_db", -10, -80, 1.5)
	music_tween.start()
	yield(music_tween, "tween_completed")
	$MusicPlayer.set_stream_paused(true)
	
func resume_background_music():
	music_tween.interpolate_property($SecondaryPlayer, "volume_db", -10, -80, 1.5)
	music_tween.start()
	$SecondaryPlayer.stop()
	yield(music_tween, "tween_completed")
	$MusicPlayer.set_stream_paused(false)
	music_tween.interpolate_property($MusicPlayer, "volume_db", -80, -10, 1.5)
	music_tween.start()

# Item Events

func _on_SearcherButton_pressed():
	play_sound("click")
	empty_holder_str = $HUD/Popup/GoogleSearch/EmptyHolder.text
	$HUD/Popup/GoogleSearch/EmptyHolder.text = "BUSCANDO ..."
	yield(get_tree().create_timer(1.0), "timeout")
	load_search_results()
	
func load_search_results():
	$HUD/Popup/GoogleSearch/EmptyHolder.visible = false
	$HUD/Popup/GoogleSearch/SearchResults.visible = true
	clean_previous_news()
	for news in Globals.get_news():
		var news_entity = preload("res://entities/NewsResult.tscn").instance()
		if news_entity:
			news_search_container.add_child(news_entity)
			news_entity.set_data(news.id, news.title)
			news_entity.connect("link_clicked", self, "on_link_clicked")

func clean_previous_news():
	for news in news_search_container.get_children():
		news.disconnect("link_clicked", self, "on_link_clicked")
		news.queue_free()
		
func on_link_clicked(news_id):
	play_sound("click")
	var news_detail = get_news_by_id(news_id)
	if !news_detail:
		return
	#print("News title: " + news_detail.title.to_upper())
	var title = news_detail.title.to_upper()
	var date = news_detail.date
	var id = news_detail.id
	var photo = news_detail.image
	news_detail_container.set_data(title, date, photo)
	news_detail_container.visible = true

func _on_TextureButton_pressed():
	play_sound("click")
	close_popup()

func close_popup():
	popup_tween.interpolate_property($HUD/Popup, "rect_position:x", 0, -320, 0.8, Tween.TRANS_QUAD, Tween.EASE_IN)
	popup_tween.start()
	yield(popup_tween, "tween_completed")
	$HUD/Popup.hide()
	
func _on_MaskButton_mouse_entered():
	$Elements/calendary/Anim.play("Hover")

func _on_MaskButton_mouse_exited():
	$Elements/calendary/Anim.stop()

# Pressed elements

func father(msg):
	return "[color=#E6DFFF]" + msg.to_upper() + "[/color]"

func colorize(msg, color="yellow"):
	return "[color="+color+"]" + msg.to_upper() + "[/color]"
	
func _on_MaskButton_pressed():
	play_sound("photo_click")
	play_music("recuerdos")
	
	$HUD/Dialogs.show_dialog([
		"UN SUCÍO Y ARRUGADO CALENDARIO TIENE RESALTADA LA FECHA [color=yellow]25 DE ENERO[/color], JUNTO A LA MARCA SE LEE: [color=yellow]CUMPLEAÑOS - CLARA.[/color]",
		father("TÚ:\nPronto habríamos podido celebrar tus 27... Quizá podría pedir chatarra y comerla en tu nombre."),
	])
	
	$HUD/Dialogs.disconnect("dialogs_over", self, "on_dialogs_over")
	$HUD/Dialogs.connect("dialogs_over", self, "on_dialogs_over")

func on_dialogs_over():
	resume_background_music()
	pass
	
func _on_PortraitButton_pressed():
	play_sound("photo_click")
	play_music("recuerdos")
	
	$HUD/Dialogs.show_dialog([
		"EL RETRATO DE UNA JOVEN MUJER. AL PIE DE LA FOTOGRAFÍA SE LEE\n[color=yellow]CLARA VERDESOTO[/color]",
		father("TÚ:\nTIENES A TU MADRE EN LA SONRISA.")
	])
	$HUD/Dialogs.disconnect("dialogs_over", self, "on_dialogs_over")
	$HUD/Dialogs.connect("dialogs_over", self, "on_dialogs_over")

func _on_ArchiveButton_pressed():
	play_sound("click")
	$HUD/Dialogs.show_dialog([
		"Pequeño libro de pasta gruesa. En la portada se ven plantas. Se lee: ".to_upper() + colorize("“Especies indómitas de Latinoamérica y flora salvaje”"),
		father("TÚ:\nLos lirios ahora me parecen más pequeños, más frágiles.\n¿Hay lirios en el vacío, CLARA?")
	])

func _on_Drawer1_pressed():
	play_sound("click")
	$HUD/Dialogs.show_dialog([
		"Dentro del cajón hay una carpeta que lleva el nombre de ".to_upper() + colorize("CLARA."),
		father("TÚ:\n¿Descuidaste esto?. Debería estar en el estudio."),
		"[QUESTION]",
		"INFORME 00034: "+colorize("CORNHEAL INDUSTRIES")+"\nCLARA VERDESOTO, CONSULTORA BIOQUÍMICA\nIDENTIFICACIÓN DE " + colorize("PATÓGENOS EN MÉTODO DE PRODUCCIÓN EN MASA."),
		father("TÚ:\n¿Patógenos en masa?"),
		"[END]",
		father("TÚ:\nSerá mejor dejarte descansar.")
	])

func _on_PostersButton_pressed():
	play_sound("click")
	$HUD/Dialogs.show_dialog([
		"Se distinguen un afiche de una película bizarra, un retrato de CLARA a carboncillo, y una planta pintada en acuarela.".to_upper()
	])

func _on_Drawer2_pressed():
	play_sound("click")
	$HUD/Dialogs.show_dialog([
		"En el cajón hay ".to_upper() + colorize("dos discos de punk") + ", ambos con carátulas garabateadas con la palabra CLARA.".to_upper(),
		"[QUESTION]",
		"En el reverso de la portada, hay una dedicatoria: “Que este disco manifieste mi pálpito. Te amo” . Att: Jorge".to_upper(),
		father("TÚ:\n¿Pero quién diablos es ese JORGE?"),
		"[SKIP]",
		father("TÚ:\nNo suena tan mal después de todo."),
		"¿Abro el segundo disco?".to_upper(),
		"[QUESTION]",
		"Un trozo de papel cae. Se lee un número :".to_upper() + colorize("03-3365-428 Thomas Berstein."),
		father("TÚ:\nBerstein... ¿de dónde me suena esto?"),
		"[END]",
		father("TÚ:\n¿Dónde venderán reproductores de CD´s?")
	])

func _on_BookButton_pressed():
	play_sound("click")
	$HUD/Dialogs.show_dialog([
		"En la portada del libro se lee: Diario de CLARA".to_upper(),
		"[QUESTION]",
		father("TÚ:\nNo tiene sentido esconderlo ahora."),
		"En una de las páginas se puede apreciar: “ T. B se ha enterado de todo, creo que debo cuidarme, me despediré de papá”.".to_upper(),
		father("TÚ:\n¿T.B?, ¿Que es un T.B?, ¿Alguna jerga de muchachos?"),
		"[END]",
		father("TÚ:\nQue al menos tus secretos se mantengan en paz")
	])

func _on_ArchiveButton_mouse_entered():
	$Elements/archive/Anim.play("Hover")

func _on_ArchiveButton_mouse_exited():
	$Elements/archive/Anim.play_backwards("Hover")

func _on_PCButton_pressed():
	if $HUD/Dialogs.is_running:
		return
	play_sound("click")
	$HUD/Popup.rect_position = Vector2(-320,0)
	$HUD/Popup.show()

	popup_tween.interpolate_property($HUD/Popup, "rect_position:x", -320, 0, 1, Tween.TRANS_QUAD, Tween.EASE_OUT)
	popup_tween.start()

	yield(popup_tween, "tween_completed")
	if Globals.first_play:
		Globals.first_play = false
		$HUD/Dialogs.show_dialog([
			"Aquí verás las ".to_upper() + colorize("noticias") + " " + colorize("busca información sobre ellas") + " antes de ".to_upper() + colorize("rechazarlas o aceptarlas") + " sin razón alguna.".to_upper(),
			"Haz click fuera de la ".to_upper() + colorize("computadora") +" para ".to_upper() + colorize("cerrar")
		])

func _on_PCButton_mouse_entered():
	$"Elements/tv-anim/Animator".play("Hover")

func _on_PCButton_mouse_exited():
	$"Elements/tv-anim/Animator".play_backwards("Hover")

func _on_PapeleraButton_pressed():
	play_sound("click")
	$HUD/Dialogs.show_dialog([
		"Es una simple papelera...".to_upper(),
		"[QUESTION]",
		father("Tú:\nUno nunca sabe lo que se esconde en la basura"),
		"Un papel arrugado está en la papelera. El papel está medio quemado.\nSe puede leer: “... solicitando a usted, Clara Verdesoto, la inmediata renuncia a su puesto de consultora ocasional por aparentes ...”".to_upper(),
		father("Aparentes..."),
		"[END]",
		father("¿Buscar en el basurero como si fuera una biblioteca?. Cosa de dementes.")
	])

# Botón diferencia
func _on_DiffButton_pressed():
	pass # Replace with function body.
