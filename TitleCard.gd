extends RichTextLabel

var introText = ["[center]It is your birthday today.[/center]",
	"[center]You don't have anybody to come to your birthday party.[/center]",
	"[center]You must go on a journey to invite the creatures of the forest to your party.[/center]"]
var page = 0
var textDone = false

func _ready():
	set_process_input(true)
	set_bbcode(introText[page])
	set_visible_characters(0)

func _input(_event):
	if Input.is_mouse_button_pressed(1) and not textDone:
		if get_visible_characters() > get_total_character_count():
			get_parent().get_child(5).play()
			if page < introText.size()-1:
				page += 1
				set_bbcode(introText[page])
				set_visible_characters(0)
			else:
				self.visible = false
				get_parent().get_child(1).visible = true
				get_parent().get_child(4).visible = true
				get_parent().get_child(3).play("FadeOut")
				textDone = true

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
