extends Dialogue

var carterDialogue = ["Carter: Hello. I am Carter, befriender of rats.",
	"Chasen: Hello Carter. I’m Chasen. Would you like to be my new friend and come to my birthday party?",
	"Carter: Oh Chasen, I would love to come to your birthday party, but there are too many rats here that don’t have any friends! If only there were someone who could help me. . .",
	"Help Carter befriend the rats?"
	]
	
var carterDialogue2 = ["Carter: Wonderful! Let’s give all of these blessed rats their very first friend. :)",
	"*Carter gives instructions."]
	
var carterDialogue3 = ["Carter: Chasen! We befriended a lot of rats today. Let’s go to your birthday party. All of the rats will be there! <3"]
	
var carterDialogue4 = ["Carter: But I can’t do it all alone . . ."]
	
var carterInteraction = [carterDialogue, carterDialogue2, carterDialogue3, carterDialogue4]
	
func _ready():
	if Global.carterStartOnQuestion:
		get_parent().get_child(0).visible = true
	interaction = Global.carterInteractionState
	page = Global.carterPageState
	set_dialogue(carterInteraction)
	set_bbcode(carterInteraction[interaction][page])
	set_visible_characters(0)
	set_process_input(true)

func _on_Button_pressed():
	get_parent().get_child(0).visible = false
	interaction += 1
	page = 0
	set_bbcode(carterInteraction[interaction][page])
	set_visible_characters(0)

func _on_Button2_pressed():
	set_bbcode(carterInteraction[3][0])
	set_visible_characters(0)
	Global.carterInteractionState = 0
	Global.carterPageState = 3
	Global.carterStartOnQuestion = true
	endConversation = true
	get_parent().get_child(0).visible = false
