extends Dialogue

var laneyDialogue = ["Laney: Hello. I am Laney, knower of knowledge. I am a dog.",
	"Chasen: Hello Laney. I’m Chasen. I’m trying to make new friends so I can invite them to my birthday party. Would you like to come?",
	"Laney: Hmm. I don’t know. I am only friends with people who are on my intellectual level.",
	"Chasen: You are a dog. You can’t be that smart.",
	"Laney: And you have no bitches.",
	"Laney: Nevertheless, I can test your overall level of knowledge with a quiz.",
	"Laney: Would you like to take it right now?",
	"Chasen: Ok."
	]
	
var laneyInteraction = [laneyDialogue]
	
func _ready():
	set_dialogue(laneyInteraction)
	set_bbcode(laneyInteraction[0][0])
	set_visible_characters(0)
	set_process_input(true)
