extends Control

signal link_clicked

var news_id = -1
var news_title

func set_data(id, title):
	news_id = id
	news_title = title.to_upper()
	$Titulo.text = news_title
	
func _on_LinkButton_pressed():
	emit_signal("link_clicked", news_id)
