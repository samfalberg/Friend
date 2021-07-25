extends RichTextLabel

var introText = ["[center]It is your birthday today.[/center]",
	"[center]You don't have anybody to come to your birthday party.[/center]",
	"[center]You must go on a journey to invite the creatures of the forest to your party.[/center]"]
var page = 0

func _ready():
	set_process_input(true)
	set_bbcode(introText[page])
	set_visible_characters(0)

func _input(_event):
	if Input.is_mouse_button_pressed(1):
		if get_visible_characters() > get_total_character_count():
			if page < introText.size()-1:
				page += 1
				set_bbcode(introText[page])
				set_visible_characters(0)
			else:
				self.visible = false
				get_parent().get_child(1).visible = true
				get_parent().get_child(4).visible = true
				get_parent().get_child(3).play("FadeOut")
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
