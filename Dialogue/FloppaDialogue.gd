extends Dialogue

var floppaDialogue = ["Floppa: Hello. I am Floppa, keeper of the peace. Under what circumstances do you stand before me?", 
	"Chasen: Hello Floppa. I’m Chasen. You look like you could be a powerful friend.",
	"Chasen: I need powerful friends so I can have a good birthday party. Would you like to come?",
	"Floppa: I am undoubtedly powerful, but I cannot be friends with any mere mortal.",
	"Floppa: You must prove yourself in the field of battle.",
	"Chasen: I could never hope to best the almighty Big Floppa in a fight.",
	"Chasen: Please oh please, won’t you just be friends with a scrawny weakling such as myself?",
	"Floppa: Even the weak can’t remain strangers to bloodshed forever.",
	"Chasen: Ok.",
	"Floppa: Prepare for battle!"
	]

var floppaInteraction = [floppaDialogue]

# Called when the node enters the scene tree for the first time.
func _ready():
	set_dialogue(floppaInteraction)
	set_bbcode(floppaInteraction[0][0])
	set_visible_characters(0)
	set_process_input(true)
