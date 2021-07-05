extends Dialogue

var harrowDialogue = ["*The creature stares at you in silence*",
	"Chasen: Hi.",
	"???: Hello.",
	"Chasen: I’m Chasen. What is your name?",
	"???: Harrow.",
	"Chasen: Hi Harrow.",
	"Harrow: Hello.",
	"*Harrow stares at you in silence*",
	"Chasen: I’m looking for new friends to invite to my birthday party. Would you like to come?",
	"Harrow: Ok.",
	"*Harrow stares at you in silence*",
	"Chasen: So you’re my friend now?",
	"Harrow: Yes.",
	"Chasen: You would like to come to my birthday party?",
	"Harrow: Yes.",
	"Chasen: Ok. But isn’t there something I need to do to earn your friendship?",
	"Harrow: No. I like having friends.",
	"Chasen: Me too. I have made many new friends today.", 
	"Chasen: But all of them wanted to learn more about my skills before they decided on coming to my party.",
	"Harrow: Oh ok. Hm . . .",
	"Harrow: You can hit my bong maybe.",
	"Chasen: I have never done this before.",
	"Harrow: That’s ok. You just tap the spacebar.",
	"Harrow: This is a video game and not real life so you don’t actually have to rip from a bong.",
	"Chasen: Cool.",
	"Harrow: Awesome."
	]

var harrowInteraction = [harrowDialogue]
	
func _ready():
	set_dialogue(harrowInteraction)
	set_bbcode(harrowInteraction[0][0])
	set_visible_characters(0)
	set_process_input(true)
