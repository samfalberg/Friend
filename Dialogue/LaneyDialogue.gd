extends Dialogue

var laneyDialogue = ["Laney: Hello. I am Laney, knower of knowledge. I am a dog.",
	"Chasen: Hello Laney. I’m Chasen. I’m trying to make new friends so I can invite them to my birthday party. Would you like to come?",
	"Laney: Hmm. I don’t know. I am only friends with people who are on my intellectual level.",
	"Chasen: You are a dog. You can’t be that smart.",
	"Laney: And you have no bitches. Nevertheless, I can test your overall level of knowledge with a quiz. Prepare for academia!",
	"Take Laney's quiz?"]
	
var laneyDialogue2 = ["Laney: You have proven yourself to be a wise and knowledgeable creature. I will be your friend, and I will also come to your birthday party. I am a dog."]

var laneyDialogue3 = ["Laney: *sad, doglike whimper*"]
	
var laneyInteraction = [laneyDialogue, laneyDialogue2, laneyDialogue3]

var postDialogue = ["Laney: Laney time, Laney time. Slipped a disc but she’s alive."]

var postInteraction = [postDialogue]
	
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.laneyDialogueOver:
		set_dialogue(postInteraction)
		set_bbcode(postInteraction[0][0])
	else:
		if Global.laneyStartOnQuestion:
			get_parent().get_child(0).visible = true
		interaction = Global.laneyInteractionState
		page = Global.laneyPageState
		set_dialogue(laneyInteraction)
		set_bbcode(laneyInteraction[interaction][page])
	set_visible_characters(0)
	set_process_input(true)

func _on_Button_pressed():
	get_parent().get_child(0).visible = false
	if interaction == 1:
		Global.laneyDialogueOver = true
		endConversation = true
		return
	interaction += 1
	page = 0
	set_bbcode(laneyInteraction[interaction][page])
	set_visible_characters(0)

func _on_Button2_pressed():
	set_bbcode(laneyInteraction[2][0])
	set_visible_characters(0)
	Global.laneyInteractionState = 0
	Global.laneyPageState = 5
	Global.laneyStartOnQuestion = true
	endConversation = true
	get_parent().get_child(0).visible = false
