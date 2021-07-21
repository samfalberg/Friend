extends RichTextLabel

var dialogue = ["Laney: Correct! Next question . . .",
	"Laney: Stupid. What a foolish answer. Try again!",
	"Laney: Welcome to Laney’s Ultra Spectacular Quiz Show. Today’s contestant is Chasen, who wants to be my friend. I am a dog.",
	"Laney: Chasen, your job is simple. I will ask you a question, and you will be given 4 answers to choose from.",
	"Laney: If you choose the right answer then you will proceed to the next question.",
	"Laney: If you choose the wrong answer, you will be sent to the fiery pits of hell. And also I won’t be your friend!",
	"Q1: Complete the following phrase . . . \n\"One bad gloop and _____ ?\"",
	"Q2: In Half Life but the AI is Self-Aware, Benry edits a specific Wikipedia article. Which article did he edit?",
	"Q3: I am a dog so it is important to me that you are educated in dog culture. What is the name of Jerma’s dog?",
	"Q4: This one’s for all the marbles. What is my favorite thing in the whole wide world?"]
var page = 2

func _ready():
	set_process_input(true)
	set_bbcode(dialogue[page])
	set_visible_characters(0)

func _input(_event):
	if Input.is_mouse_button_pressed(1) && not get_parent().get_child(0).visible:
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size()-1:
				page += 1
				set_bbcode(dialogue[page])
				set_visible_characters(0)
				if page > 5:
					get_parent().get_child(0).visible = true
					set_answers(page)
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	
func set_answers(question):
	match question:
		6:
			get_parent().get_child(0).get_child(0).text = "a big ass splergy"
			get_parent().get_child(0).get_child(1).text = "she do what I yoinky"
			get_parent().get_child(0).get_child(2).text = "I make friends with Laney"
			get_parent().get_child(0).get_child(3).text = "I buy me a smoothie"
		7:
			get_parent().get_child(0).get_child(0).text = "All Dogs Go to Heaven 2"
			get_parent().get_child(0).get_child(1).text = "Chair"
			get_parent().get_child(0).get_child(2).text = "Kane & Lynch 2: Dog Days"
			get_parent().get_child(0).get_child(3).text = "Air Bud"
		8:
			get_parent().get_child(0).get_child(0).text = "Jamie"
			get_parent().get_child(0).get_child(1).text = "Otto"
			get_parent().get_child(0).get_child(2).text = "Greg"
			get_parent().get_child(0).get_child(3).text = "Frotland"
		9:
			get_parent().get_child(0).get_child(0).text = "Sunbathing"
			get_parent().get_child(0).get_child(1).text = "Relaxing walks"
			get_parent().get_child(0).get_child(2).text = "Treats"
			get_parent().get_child(0).get_child(3).text = "All of the above"
			
func _on_Button_pressed():
	if page == 7:
		set_bbcode(dialogue[0])
	else:
		set_bbcode(dialogue[1])
		page -= 1
	set_visible_characters(0)
	get_parent().get_child(0).visible = false

func _on_Button2_pressed():
	if page == 6 or page == 8:
		set_bbcode(dialogue[0])
	else:
		set_bbcode(dialogue[1])
		page -= 1
	set_visible_characters(0)
	get_parent().get_child(0).visible = false

func _on_Button3_pressed():
	set_bbcode(dialogue[1])
	set_visible_characters(0)
	get_parent().get_child(0).visible = false
	page -= 1

func _on_Button4_pressed():
	if page != 9:
		set_bbcode(dialogue[1])
		set_visible_characters(0)
		get_parent().get_child(0).visible = false
		page -= 1
	else:
		Global.emit_signal("quiz_complete")
		get_parent().visible = false
