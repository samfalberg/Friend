extends Dialogue

var MINIGAME = preload("res://Minigames/Bong.tscn")
var game

var harrowDialogue = ["*The creature stares at you in silence*",
	"Chasen: Hi.",
	"???: Hello.",
	"Chasen: I’m Chasen. What is your name?",
	"???: Harrow.",
	"Chasen: Hi Harrow.",
	"Harrow: Hello.",
	"*Harrow stares at you in silence*",
	"Chasen: I’m looking for new friends to invite to my birthday party. Would you like to come?",
	"Harrow: Ok.",
	"*Harrow stares at you in silence*",
	"Chasen: So you’re my friend now?",
	"Harrow: Yes.",
	"Chasen: You would like to come to my birthday party?",
	"Harrow: Yes.",
	"Chasen: Ok. But isn’t there something I need to do to earn your friendship?",
	"Harrow: No. I like having friends.",
	"Chasen: Me too. I have made many new friends today. But all of them wanted to learn more about my skills before they decided on coming to my party.",
	"Harrow: Oh ok. Hm . . . You can hit my bong maybe.",
	"Chasen: I have never done this before.",
	"Harrow: That’s ok. You just tap the spacebar. This is a video game and not real life so you don’t actually have to rip from a bong.",
	"Hit the bong?"
	]
	
var harrowDialogue2 = ["Harrow: You took an epic hit of Harrow’s sweet schticky gush. Good job! I will see you later at the party. I will have the local Brazilian steakhouse cater some tasty meats."]

var harrowDenial = ["Harrow: wtfwtfwtf"]

var harrowInteraction = [harrowDenial, harrowDialogue, harrowDialogue2]

var postDialogue = ["*Harrow stares at you in friendly silence*"]

var postInteraction = [postDialogue]
	
func _ready():
	game = MINIGAME.instance()
	get_parent().get_parent().add_child(game)
	game.visible = false
	game.pause_mode = Node.PAUSE_MODE_STOP
	
	if Global.harrowDialogueOver:
		set_dialogue(postInteraction, "Harrow")
		set_bbcode(postInteraction[0][0])
	else:	
		if Global.harrowStartOnQuestion:
			get_parent().get_child(0).visible = true
		interaction = Global.harrowInteractionState
		page = Global.harrowPageState
		set_dialogue(harrowInteraction, "Harrow")
		set_bbcode(harrowInteraction[interaction][page])
	set_visible_characters(0)
	set_process_input(true)

func _on_Button_pressed():
	get_parent().get_child(0).visible = false
	game.visible = true
	game.pause_mode = Node.PAUSE_MODE_PROCESS
	get_parent().pause_mode = Node.PAUSE_MODE_STOP
	get_parent().visible = false
	yield(game, "bong_ripped")
	get_parent().pause_mode = Node.PAUSE_MODE_PROCESS
	get_parent().visible = true
	print("ladies and gentlemen, bong has been ripped")
	interaction += 1
	page = 0
	set_bbcode(harrowInteraction[interaction][page])
	set_visible_characters(0)

func _on_Button2_pressed():
	set_bbcode(harrowInteraction[0][0])
	set_visible_characters(0)
	Global.harrowInteractionState = 1
	Global.harrowPageState = 21
	Global.harrowStartOnQuestion = true
	endConversation = true
	startOnQuestion = true
	get_parent().get_child(0).visible = false
