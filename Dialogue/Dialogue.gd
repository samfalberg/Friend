extends RichTextLabel
class_name Dialogue

var dialogue
var interaction = 0
var page = 0
var endConversation = false

func _input(_event):
	if Input.is_mouse_button_pressed(1) && not get_parent().get_child(0).visible:
#		print("Interaction: " + str(interaction) + ", page: " + str(page))
		show_text()

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	
func set_dialogue(script):
	dialogue = script.duplicate()
	
func show_text():
	if endConversation && get_visible_characters() < get_total_character_count():
		set_visible_characters(get_total_character_count())
		return 
	elif endConversation:
		end_conversation()
		
	if get_visible_characters() >= get_total_character_count():
			if page < dialogue[interaction].size() - 1:
				if page == dialogue[interaction].size() - 2:
					get_parent().get_child(0).visible = true
				page += 1
				set_bbcode(dialogue[interaction][page])
				set_visible_characters(0)
			else:
				if interaction < dialogue.size() - 1:
#					page = 0
#					interaction += 1
#					set_bbcode(dialogue[interaction][page])
#					set_visible_characters(0)
					get_parent().get_child(0).visible = true
				else:
					end_conversation()
	else:
		set_visible_characters(get_total_character_count())

func end_conversation():
	get_parent().queue_free()
	get_tree().paused = false
