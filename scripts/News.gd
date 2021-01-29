extends Control

onready var tween = $Tween
onready var likes = $Base/HearthIcon/LblLikes
onready var comments = $Base/CommentsIcon/LblComments

var rand = RandomNumberGenerator.new()
var id = -1
signal search_news

func _ready():
	$Rejected.visible = false
	$Passed.visible = false

func set_data(news_id, title, date, image):
	id = news_id
	$Base/Titulo.text = title.to_upper()
	$Base/Fecha.text = date
	
	if image:
		$Base/Foto.texture = load("res://assets/elements/news_images/" + image + ".png")
	
	rand.randomize()
	likes.text = String(rand.randi_range(0,50))
	comments.text = String(rand.randi_range(0,30))

func _on_AcceptButton_pressed():
	$Rejected.visible = false
	$Passed.visible = true

func _on_RejectButton_pressed():
	$Passed.visible = false
	$Rejected.visible = true

func _on_SearchButton_pressed():
	emit_signal("search_news", id)
