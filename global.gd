extends Node2D

var bingusInteractionState = 1
var bingusPageState = 0
var bingusStartOnQuestion = false
var bingusDialogueOver = false

var floppaInteractionState = 1
var floppaPageState = 0
var floppaStartOnQuestion = false
var floppaDialogueOver = false
signal fight_start
signal fight_complete
signal show_health
signal hide_health

var laneyInteractionState = 1
var laneyPageState = 0
var laneyStartOnQuestion = false
var laneyDialogueOver = false
signal quiz_complete

var harrowInteractionState = 1
var harrowPageState = 0
var harrowStartOnQuestion = false
var harrowDialogueOver = false

var carterInteractionState = 1
var carterPageState = 0
var carterStartOnQuestion = false

func _ready():
	pass # Replace with function body.
