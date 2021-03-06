extends Dialogue

var MINIGAME = preload("res://Minigames/Quiz.tscn")
var game

var laneyDialogue = ["Laney: Hello. I am Laney, knower of knowledge. I am a dog.",
	"Chasen: Hello Laney. I’m Chasen. I’m trying to make new friends so I can invite them to my birthday party. Would you like to come?",
	"Laney: Hmm. I don’t know. I am only friends with people who are on my intellectual level.",
	"Chasen: You are a dog. You can’t be that smart.",
	"Laney: And you have no bitches. Nevertheless, I can test your overall level of knowledge with a quiz. Prepare for academia!",
	"Take Laney's quiz?"]
	
var laneyDialogue2 = ["Laney: Wow! You really are smart!",
	"Laney: You have proven yourself to be a wise and knowledgeable creature. I will be your friend, and I will also come to your birthday party. I am a dog."]

var laneyDenial = ["Laney: *sad, doglike whimper*"]
	
var laneyInteraction = [laneyDenial, laneyDialogue, laneyDialogue2]

var postDialogue = ["Laney: ????????????????????????Laney time, Laney time. Slipped a disc but she’s alive."]

var postInteraction = [postDialogue]
	
# Called when the node enters the scene tree for the first time.
func _ready():
	game = MINIGAME.instance()
	get_parent().get_parent().add_child(game)
	game.visible = false
	game.pause_mode = Node.PAUSE_MODE_STOP
	
	if Global.laneyDialogueOver:
		set_dialogue(postInteraction, "Laney")
		set_bbcode(postInteraction[0][0])
	else:
		if Global.laneyStartOnQuestion:
			get_parent().get_child(0).visible = true
		interaction = Global.laneyInteractionState
		page = Global.laneyPageState
		set_dialogue(laneyInteraction, "Laney")
		set_bbcode(laneyInteraction[interaction][page])
	set_visible_characters(0)
	set_process_input(true)

func _on_Button_pressed():
	get_parent().get_child(3).play()
	get_parent().get_child(0).visible = false
	game.visible = true
	game.pause_mode = Node.PAUSE_MODE_PROCESS
	get_parent().pause_mode = Node.PAUSE_MODE_STOP
	yield(Global, "quiz_complete")
	get_parent().pause_mode = Node.PAUSE_MODE_PROCESS
	
	interaction += 1
	page = 0
	set_bbcode(laneyInteraction[interaction][page])
	set_visible_characters(0)

func _on_Button2_pressed():
	get_parent().get_child(3).play()
	set_bbcode(laneyInteraction[0][0])
	set_visible_characters(0)
	Global.laneyInteractionState = 1
	Global.laneyPageState = 5
	Global.laneyStartOnQuestion = true
	endConversation = true
	startOnQuestion = true
	get_parent().get_child(0).visible = false
