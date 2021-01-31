extends Control

onready var title_label = $ScrollContainer/Control/LblTitle
onready var date_label = $ScrollContainer/Control/LblDate
onready var photo = $ScrollContainer/Control/Photo
onready var source_label = $ScrollContainer/Control/LblSource

var news_title
var news_date
var news_image

func set_source(src):
	source_label.text = "SOURCE: " + src.to_upper()
	
func set_data(title, date, image):
	news_title = title
	news_date = date
	news_image = image
	
	title_label.text = news_title
	date_label.text = news_date
	
	if news_image:
		photo.texture = load("res://assets/elements/news_images/" + news_image + ".png")

func _on_LinkButton_pressed():
	visible = false
