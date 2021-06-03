extends RichTextLabel

var dialogue = ["Hello. I am Bingus, singer of songs. What brings you here today?", 
	"Hello Bingus. I’m Chasen. I don’t have any friends to come to my birthday party, so I’m looking for new friends to invite. Would you like to come?"]
var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _input(_event):
	if Input.is_mouse_button_pressed(1):
		if get_visible_characters() >= get_total_character_count():
			if page < dialogue.size() - 1:
				page += 1
				set_bbcode(dialogue[page])
				set_visible_characters(0)
			else:
				get_parent().queue_free()
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
