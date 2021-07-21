extends RichTextLabel
class_name Dialogue

var dialogue
var interaction = 0
var page = 0
var endConversation = false
var startOnQuestion = false
var friendName

func _input(_event):
	if Input.is_mouse_button_pressed(1) && not get_parent().get_child(0).visible:
		show_text()

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	
func set_dialogue(script, friend):
	dialogue = script.duplicate()
	friendName = friend
	
func show_text():
	if endConversation:
		if get_visible_characters() < get_total_character_count():
			set_visible_characters(get_total_character_count())
		else:
			end_conversation()
		return
		
	if get_visible_characters() >= get_total_character_count():
			if page < dialogue[interaction].size() - 1:
				page += 1
				set_bbcode(dialogue[interaction][page])
				set_visible_characters(0)
			else:
				if interaction < dialogue.size() - 1:
					if interaction == 1:
						get_parent().get_child(0).visible = true
					else:
						page = 0
						interaction += 1
						set_bbcode(dialogue[interaction][page])
						set_visible_characters(0)
				else:
					end_conversation()
	else:
		set_visible_characters(get_total_character_count())

func end_conversation():
	if not startOnQuestion:
		match friendName:
			"Bingus":
				Global.bingusDialogueOver = true
			"Floppa":
				Global.floppaDialogueOver = true
			"Laney":
				Global.laneyDialogueOver = true
			"Harrow":
				Global.harrowDialogueOver = true
			"Carter":
				Global.carterDialogueOver = true
	# Free the minigame and dialogue box
	get_parent().get_parent().get_child(get_parent().get_parent().get_child_count() - 1).queue_free()
	get_parent().get_parent().get_parent().get_child(5).visible = false
	get_parent().queue_free()
	get_tree().paused = false
