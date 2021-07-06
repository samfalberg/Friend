extends Dialogue

var laneyDialogue = ["Laney: Hello. I am Laney, knower of knowledge. I am a dog.",
	"Chasen: Hello Laney. Iâ€™m Chasen. Iâ€™m trying to make new friends so I can invite them to my birthday party. Would you like to come?",
	"Laney: Hmm. I donâ€™t know. I am only friends with people who are on my intellectual level.",
	"Chasen: You are a dog. You canâ€™t be that smart.",
	"Laney: And you have no bitches. Nevertheless, I can test your overall level of knowledge with a quiz. Prepare for academia!",
	"Take Laney's quiz?"]
	
var laneyDialogue2 = ["Laney: You have proven yourself to be a wise and knowledgeable creature. I will be your friend, and I will also come to your birthday party. I am a dog."]

var laneyDenial = ["Laney: *sad, doglike whimper*"]
	
var laneyInteraction = [laneyDenial, laneyDialogue, laneyDialogue2]

var postDialogue = ["Laney: í ´íµŸí ´íµŸí ´íµŸí ´íµŸLaney time, Laney time. Slipped a disc but sheâ€™s alive."]

var postInteraction = [postDialogue]
	
# Called when the node enters the scene tree for the first time.
func _ready():
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
	get_parent().get_child(0).visible = false
	interaction += 1
	page = 0
	set_bbcode(laneyInteraction[interaction][page])
	set_visible_characters(0)

func _on_Button2_pressed():
	set_bbcode(laneyInteraction[0][0])
	set_visible_characters(0)
	Global.laneyInteractionState = 1
	Global.laneyPageState = 5
	Global.laneyStartOnQuestion = true
	endConversation = true
	startOnQuestion = true
	get_parent().get_child(0).visible = false
