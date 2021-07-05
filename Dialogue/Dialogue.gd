extends RichTextLabel
class_name Dialogue

var dialogue
var interaction = 0
var page = 0
	
func _input(_event):
	if Input.is_mouse_button_pressed(1):
		if get_visible_characters() >= get_total_character_count():
			if page < dialogue[interaction].size() - 1:
				page += 1
				set_bbcode(dialogue[interaction][page])
				set_visible_characters(0)
			else:
				if interaction < dialogue.size() - 1:
					page = 0
					interaction += 1
					set_bbcode(dialogue[interaction][page])
					set_visible_characters(0)
				else:
					get_parent().queue_free()
					get_tree().paused = false
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	
func set_dialogue(script):
	dialogue = script.duplicate()
