extends Dialogue

var floppaDialogue = ["Floppa: Hello. I am Floppa, keeper of the peace. Under what circumstances do you stand before me?", 
	"Chasen: Hello Floppa. I’m Chasen. You look like you could be a powerful friend. I need powerful friends so I can have a good birthday party. Would you like to come?",
	"Floppa: I am undoubtedly powerful, but I cannot be friends with any mere mortal. You must prove yourself in the field of battle.",
	"Chasen: I could never hope to best the almighty Big Floppa in a fight. Please oh please, won’t you just be friends with a scrawny weakling such as myself?",
	"Floppa: Even the weak can’t remain strangers to bloodshed forever. Prepare for battle!",
	"Fight Floppa?"
	]

var floppaDialogue2 = ["Floppa: You are a brave soul, testing my strength like that. Even though I was only using a fraction of my power, you have still proven yourself worthy of Floppa Friendship.",
	"Floppa: I will attend your party and make it the greatest birthday the world has ever known!"]

var floppaDenial = ["Floppa: Coward . . ."]

var floppaInteraction = [floppaDenial, floppaDialogue, floppaDialogue2]

var postDialogue = ["Floppa: I know karate and jiu jitsu and krav maga and taekwondo and kung fu and . . ."]

var postInteraction = [postDialogue]

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.floppaDialogueOver:
		set_dialogue(postInteraction, "Floppa")
		set_bbcode(postInteraction[0][0])
	else:
		if Global.floppaStartOnQuestion:
			get_parent().get_child(0).visible = true
		interaction = Global.floppaInteractionState
		page = Global.floppaPageState
		set_dialogue(floppaInteraction, "Floppa")
		set_bbcode(floppaInteraction[interaction][page])
	set_visible_characters(0)
	set_process_input(true)

func _on_Button_pressed():
	get_parent().get_child(0).visible = false
	Global.emit_signal("fight_start")
	Global.emit_signal("show_health")
	get_tree().paused = false
	get_parent().pause_mode = Node.PAUSE_MODE_STOP
	get_parent().visible = false
	yield(Global, "fight_complete")
	Global.emit_signal("hide_health")
	get_parent().pause_mode = Node.PAUSE_MODE_PROCESS
	get_parent().visible = true
	get_tree().paused = true

	interaction += 1
	page = 0
	set_bbcode(floppaInteraction[interaction][page])
	set_visible_characters(0)

func _on_Button2_pressed():
	set_bbcode(floppaInteraction[0][0])
	set_visible_characters(0)
	Global.floppaInteractionState = 1
	Global.floppaPageState = 5
	Global.floppaStartOnQuestion = true
	endConversation = true
	startOnQuestion = true
	get_parent().get_child(0).visible = false
