extends Dialogue

var bingusDialogue = ["Bingus: Hello. I am Bingus, singer of songs. What brings you here today?", 
	"Chasen: Hello Bingus. I’m Chasen. I don’t have any friends to come to my birthday party, so I’m looking for new friends to invite. Would you like to come?", 
	"Bingus: I love birthday parties. They bring me great joy.",
	"Bingus: However, I can’t be friends with just anybody.", 
	"Bingus: Music is very close to my heart, so I will only be friends with the musically talented.",
	"Chasen: I used to play percussion in high school.",
	"Bingus: Very impressive. I can’t go off of anecdotal evidence alone, though.",
	"Bingus: How about this - If you’re able to sing my famous Bingus Jingle, then I will be your friend.",
	"Bingus: What do you say?"]
	
var bingusDialogue2 = ["Bingus: First let me demonstrate the Bingus Jingle.",
	"this is a test",
	"and another test"]

var bingusDialogue3 = ["Bingus: Now it's your turn!"]

var bingusDialogue4 = ["Bingus: Splendid job! The hearts of Bingii all across the world are filled with the bliss of song.",
	"Bingus: I would be honored to call you a friend. See you at the party!"]
	
var bingusDialogue5 = ["Bingus: You just ruined my day."]
	
var bingusInteraction = [bingusDialogue, bingusDialogue2, bingusDialogue3, bingusDialogue4, bingusDialogue5]

var postDialogue = ["Bingus: Can I have a peppermint? You can have a peppermint. That's too hot for me. . . "]

var postInteraction = [postDialogue]
	
func _ready():
	if Global.bingusDialogueOver:
		set_dialogue(postInteraction)
		set_bbcode(postInteraction[0][0])
	else:
		if Global.bingusStartOnQuestion:
			get_parent().get_child(0).visible = true
		interaction = Global.bingusInteractionState
		page = Global.bingusPageState
		set_dialogue(bingusInteraction)
		set_bbcode(bingusInteraction[interaction][page])
	set_visible_characters(0)
	set_process_input(true)

func _on_Button_pressed():
	get_parent().get_child(0).visible = false
	if interaction == 3:
		Global.bingusDialogueOver = true
		endConversation = true
		return
	interaction += 1
	page = 0
	set_bbcode(bingusInteraction[interaction][page])
	set_visible_characters(0)

func _on_Button2_pressed():
	set_bbcode(bingusInteraction[4][0])
	set_visible_characters(0)
	Global.bingusInteractionState = 0
	Global.bingusPageState = 8
	Global.bingusStartOnQuestion = true
	endConversation = true
	get_parent().get_child(0).visible = false
