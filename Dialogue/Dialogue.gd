extends RichTextLabel
class_name Dialogue

var dialogue
var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _input(_event):
	if Input.is_mouse_button_pressed(1):
		if get_visible_characters() >= get_total_character_count():
			if page < dialogue.size() - 1:
				page += 1
				set_bbcode(dialogue[page])
				set_visible_characters(0)
			else: # Remove dialogue box and allow player to move again
				get_parent().queue_free()
				get_tree().paused = false
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	
func _set_dialogue(script: Array):
	dialogue = script.duplicate()
