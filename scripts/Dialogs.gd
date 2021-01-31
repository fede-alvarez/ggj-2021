extends Control

onready var text_label = $RichTextLabel
onready var confirm_button = $ConfirmButton
onready var deny_button = $DenyButton
onready var tween = $CharsTween

var dialogs = []
var current_dialog = 0
var dialogs_count = 0

var is_running = false

signal dialogs_over

func _ready():
	confirm_button.visible = false
	deny_button.visible = false
	visible = false
	
func show_dialog( dialog_lines ):
	if is_running:
		return
	is_running = true
	visible = true
	dialogs_count = dialog_lines.size()
	dialogs.clear()
	for dialog in dialog_lines:
		dialogs.append(dialog)
	
	update_text(dialogs[current_dialog])
	$DialogTime.start()
	text_label.visible_characters = 0
	tween.interpolate_property(text_label, "percent_visible", 0, 1, $DialogTime.wait_time - 2)
	tween.start()

func update_text( msg ):
	text_label.bbcode_text = "[center]"+msg+"[/center]";
	#text_label.visible_characters = 0
	
func _on_DialogTime_timeout():
	current_dialog += 1
	
	if current_dialog > dialogs_count - 1:
		close_dialog()
	else:
		var dialog_command = dialogs[current_dialog]
		if dialog_command in ["[QUESTION]", "[END]", "[SKIP]"]:
			match dialog_command:
				"[QUESTION]":
					$DialogTime.stop()
					confirm_button.visible = true
					deny_button.visible = true
				"[END]":
					close_dialog()
				"[SKIP]":
					var pos = get_tag_position("SKIP")
					current_dialog = pos+2
					update_text(dialogs[current_dialog])
					$DialogTime.start()
					text_label.visible_characters = 0
					tween.interpolate_property(text_label, "percent_visible", 0, 1, $DialogTime.wait_time - 1)
					tween.start()
		else:
			update_text(dialogs[current_dialog])
			$DialogTime.stop()
			$DialogTime.start()
			text_label.visible_characters = 0
			tween.interpolate_property(text_label, "percent_visible", 0, 1, $DialogTime.wait_time - 1)
			tween.start()

func close_dialog():
	current_dialog = 0
	$DialogTime.stop()
	visible = false
	is_running = false
	emit_signal("dialogs_over")

func _on_ConfirmButton_pressed():
	hide_buttons()
	current_dialog += 1
	update_text(dialogs[current_dialog])
	$DialogTime.start()

func _on_DenyButton_pressed():
	hide_buttons()
	var end_pos = get_end_position()
	current_dialog = end_pos+1
	update_text(dialogs[end_pos+1])
	$DialogTime.start()
	
func get_end_position():
	var index = 0
	for dialog in dialogs:
		if dialog == "[END]":
			return index
		index += 1
		
func get_tag_position(tag):
	var index = 0
	for dialog in dialogs:
		if dialog == "["+tag+"]":
			return index
		index += 1
func hide_buttons():
	confirm_button.visible = false
	deny_button.visible = false
