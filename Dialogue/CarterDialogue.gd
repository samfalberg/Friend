extends Dialogue

var carterDialogue = ["Carter: Hello. I am Carter, befriender of rats.",
	"Chasen: Hello Carter. I’m Chasen. Would you like to be my new friend and come to my birthday party?",
	"Carter: Oh Chasen, I would love to come to your birthday party, but there are too many rats here that don’t have any friends!",
	"Carter: Can you help me befriend these rats first?"
	]
	
func _ready():
	_set_dialogue(carterDialogue)
	set_bbcode(carterDialogue[page])
	set_visible_characters(0)
	set_process_input(true)
