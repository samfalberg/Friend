extends Dialogue

var carterDialogue = ["Carter: Hello. I am Carter, befriender of rats.",
	"Chasen: Hello Carter. I’m Chasen. Would you like to be my new friend and come to my birthday party?",
	"Carter: Oh Chasen, I would love to come to your birthday party, but there are too many rats here that don’t have any friends! If only there were someone who could help me. . .",
	"Carter: The white rat loves to eat cheese. The brown rat likes to be sung to. And the grey rat enjoys delicate pets. You should give these rats their very first friend!"
	]
	
var carterDialogue2 = ["Carter: You did it, Chasen! We befriended a lot of rats today. Let’s go to your birthday party. All of your new friends will be there! <3"]
	
var carterDenial = ["Carter: But I can’t do it all alone . . ."]
	
var carterInteraction = [carterDenial, carterDialogue, carterDialogue2]
	
func _ready():
	if Global.carterStartOnQuestion:
		get_parent().get_child(0).visible = true
	interaction = Global.carterInteractionState
	page = Global.carterPageState
	set_dialogue(carterInteraction, "Carter")
	set_bbcode(carterInteraction[interaction][page])
	set_visible_characters(0)
	set_process_input(true)

func _on_Button_pressed():
	get_parent().get_child(3).play()
	get_parent().get_child(0).visible = false
	Global.emit_signal("speed_friend_start")
	get_tree().paused = false
	get_parent().pause_mode = Node.PAUSE_MODE_STOP
	get_parent().visible = false
	yield(Global, "speed_friend_complete")
	get_parent().pause_mode = Node.PAUSE_MODE_PROCESS
	get_parent().visible = true
	get_tree().paused = true
	get_parent().get_child(0).visible = false
	
	interaction += 1
	page = 0
	set_bbcode(carterInteraction[interaction][page])
	set_visible_characters(0)

func _on_Button2_pressed():
	get_parent().get_child(3).play()
	set_bbcode(carterInteraction[0][0])
	set_visible_characters(0)
	Global.carterInteractionState = 1
	Global.carterPageState = 3
	Global.carterStartOnQuestion = true
	endConversation = true
	startOnQuestion = true
	get_parent().get_child(0).visible = false
