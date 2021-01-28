extends Node2D

onready var news_container = $HUD/Popup/NewsContainer/VBoxContainer
onready var search_text = $HUD/Popup/TxtSearch

func _ready():
	#$HUD/Popup.show()
	for news in Globals.NEWS:
		var news_entity = preload("res://entities/Noticia.tscn").instance()
		if news_entity:
			news_container.add_child(news_entity)
			news_entity.set_data(news.id, news.title, news.date, "")
			news_entity.connect("search_news", self, "on_news_searched")
	pass

func on_news_searched( id ):
	print("Search for news: " + String(id))
	search_text.text = (Globals.NEWS[id-1].title).to_upper()
	pass
	
# Item Events
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		$HUD/Popup.show()

func _on_OutsideScreenArea_input_event(viewport, event, shape_idx):
	if $HUD/Popup.is_visible_in_tree():
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			$HUD/Popup.hide()
