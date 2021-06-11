extends Dialogue

var bingusDialogue = ["Bingus: Hello. I am Bingus, singer of songs. What brings you here today?", 
	"Chasen: Hello Bingus. I’m Chasen. I don’t have any friends to come to my birthday party, so I’m looking for new friends to invite. Would you like to come?", 
	"Bingus: I love birthday parties. They bring me great joy.",
	"Bingus: However, I can’t be friends with just anybody.", 
	"Bingus: Music is very close to my heart, so I will only be friends with the musically talented."]

#"Bingus: Very impressive. I can’t go off of anecdotal evidence alone, though.",
#	"Bingus: How about this: If you’re able to sing my famous Bingus Jingle, then I will be your friend.", 
#	"Bingus: What do you say?",
#	"Chasen: Ok.",
#	"Bingus: First let me demonstrate the Bingus Jingle.",
#	"*Bingus sings the jingle*",
#	"Bingus: Now it's your turn!", 
#	"Bingus: Splendid job! The hearts of Bingii all across the world are filled with the bliss of song.",
#	"Bingus: I would be honored to call you a friend. See you at the party!"
	
func _ready():
	_set_dialogue(bingusDialogue)
	next_dialogue("res://Dialogue/ChoiceBox.tscn")
	set_bbcode(bingusDialogue[page])
	set_visible_characters(0)
	set_process_input(true)
