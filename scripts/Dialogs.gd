extends Control

onready var text_label = $RichTextLabel

func _ready():
	visible = false
	
func show_dialog(msg):
	visible = true
	text_label.bbcode_text = "[center]"+msg+"[/center]";
	$DialogTime.start()

func _on_DialogTime_timeout():
	visible = false
