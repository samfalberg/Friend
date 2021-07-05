extends Dialogue

var carterDialogue = ["Carter: Hello. I am Carter, befriender of rats.",
	"Chasen: Hello Carter. I’m Chasen. Would you like to be my new friend and come to my birthday party?",
	"Carter: Oh Chasen, I would love to come to your birthday party, but there are too many rats here that don’t have any friends!",
	"Carter: Can you help me befriend these rats first?"
	]
	
var carterInteraction = [carterDialogue]
	
func _ready():
	set_dialogue(carterInteraction)
	set_bbcode(carterInteraction[0][0])
	set_visible_characters(0)
	set_process_input(true)
