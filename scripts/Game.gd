extends Node2D

onready var news_container = $HUD/Popup/NewsContainer/VBoxContainer
onready var news_search_container = $HUD/Popup/GoogleSearch/SearchResults/ScrollResults/VBoxContainer
onready var search_text = $HUD/Popup/TxtSearch

onready var news_detail_container = $HUD/Popup/NewsDetail

onready var popup_tween = $HUD/Popup/PopupTween

var empty_holder_str = 'HAZ CLICK EN LA "LUPA" DE LA NOTICIA PARA COMENZAR'

func _ready():
	#$HUD/Popup.show()
	$HUD/Popup/InputBorder.visible = false
	$HUD/Popup/SearcherButton.disabled = true
	$HUD/Popup/GoogleSearch/EmptyHolder.visible = true
	$HUD/Popup/GoogleSearch/SearchResults.visible = false
	news_detail_container.visible = false
	
	for news in Globals.get_news():
		var news_entity = preload("res://entities/Noticia.tscn").instance()
		if news_entity:
			news_container.add_child(news_entity)
			news_entity.set_data(news.id, news.title, news.date, news.image)
			news_entity.connect("search_news", self, "on_news_searched")
	pass

func on_news_searched( id ):
	var news_detail = Globals.NEWS[id-1]
	search_text.text = (news_detail.title).to_upper()
	$HUD/Popup/InputBorder.visible = true
	$HUD/Popup/SearcherButton.disabled = false
	
	$HUD/Popup/GoogleSearch/EmptyHolder.text = empty_holder_str
	$HUD/Popup/GoogleSearch/EmptyHolder.visible = true
	$HUD/Popup/GoogleSearch/SearchResults.visible = false
	
# Item Events
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		$HUD/Popup.rect_position = Vector2(-320,0)
		$HUD/Popup.show()
		
		popup_tween.interpolate_property($HUD/Popup, "rect_position:x", -320, 0, 1, Tween.TRANS_QUAD, Tween.EASE_OUT)
		popup_tween.start()

func _on_SearcherButton_pressed():
	empty_holder_str = $HUD/Popup/GoogleSearch/EmptyHolder.text
	$HUD/Popup/GoogleSearch/EmptyHolder.text = "BUSCANDO ..."
	yield(get_tree().create_timer(1.0), "timeout")
	load_search_results()
	
func load_search_results():
	$HUD/Popup/GoogleSearch/EmptyHolder.visible = false
	$HUD/Popup/GoogleSearch/SearchResults.visible = true
	clean_previous_news()
	for news in Globals.NEWS:
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
	var news_detail = Globals.NEWS[news_id-1]
	#print("News title: " + news_detail.title.to_upper())
	var title = news_detail.title.to_upper()
	var date = news_detail.date
	var id = news_detail.id
	var photo = news_detail.image
	news_detail_container.set_data(title, date, photo)
	news_detail_container.visible = true
	


func _on_TextureButton_pressed():
	popup_tween.interpolate_property($HUD/Popup, "rect_position:x", 0, -320, 0.8, Tween.TRANS_QUAD, Tween.EASE_IN)
	popup_tween.start()
	yield(popup_tween, "tween_completed")
	$HUD/Popup.hide()
