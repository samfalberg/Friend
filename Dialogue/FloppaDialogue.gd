extends Dialogue

var floppaDialogue = ["Floppa: Hello. I am Floppa, keeper of the peace. Under what circumstances do you stand before me?", 
	"Chasen: Hello Floppa. I’m Chasen. You look like you could be a powerful friend. I need powerful friends so I can have a good birthday party. Would you like to come?",
	"Floppa: I am undoubtedly powerful, but I cannot be friends with any mere mortal. You must prove yourself in the field of battle.",
	"Chasen: I could never hope to best the almighty Big Floppa in a fight.",
	"Chasen: Please oh please, won’t you just be friends with a scrawny weakling such as myself?",
	"Floppa: Even the weak can’t remain strangers to bloodshed forever. Prepare for battle!",
	"Fight Floppa?"
	]

var floppaDialogue2 = ["Floppa: You are a brave soul, testing my strength like that. Even though I was only using a fraction of my power, you have still proven yourself worthy of Floppa Friendship.",
	"Floppa: I will attend your party and make it the greatest birthday the world has ever known!"]

var floppaDialogue3 = ["Floppa: Coward . . ."]

var floppaInteraction = [floppaDialogue, floppaDialogue2, floppaDialogue3]

var postDialogue = ["Floppa: I know karate and jiu jitsu and krav maga and taekwondo and kung fu and. . ."]

var postInteraction = [postDialogue]

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.floppaDialogueOver:
		set_dialogue(postInteraction)
		set_bbcode(postInteraction[0][0])
	else:
		if Global.floppaStartOnQuestion:
			get_parent().get_child(0).visible = true
		interaction = Global.floppaInteractionState
		page = Global.floppaPageState
		set_dialogue(floppaInteraction)
		set_bbcode(floppaInteraction[interaction][page])
	set_visible_characters(0)
	set_process_input(true)

func _on_Button_pressed():
	get_parent().get_child(0).visible = false
	if interaction == 1:
		Global.floppaDialogueOver = true
		endConversation = true
		return
	interaction += 1
	page = 0
	set_bbcode(floppaInteraction[interaction][page])
	set_visible_characters(0)

func _on_Button2_pressed():
	set_bbcode(floppaInteraction[2][0])
	set_visible_characters(0)
	Global.floppaInteractionState = 0
	Global.floppaPageState = 6
	Global.floppaStartOnQuestion = true
	endConversation = true
	get_parent().get_child(0).visible = false
