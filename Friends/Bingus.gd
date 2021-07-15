extends Friend

onready var timer = $Timer
var note = 1

func _ready():
	Global.connect("bingus_song_start", self, "sing")
	Global.connect("chasen_song_complete", self, "hide_arrows")

func sing():
	timer.start()
	match note:
		1:
			get_node("HBoxContainer/Sprite").visible = true
		2:
			get_node("HBoxContainer/Sprite2").visible = true
		3:
			get_node("HBoxContainer/Sprite3").visible = true
		4:
			get_node("HBoxContainer/Sprite4").visible = true
		5:
			get_node("HBoxContainer/Sprite5").visible = true
		6:
			Global.emit_signal("bingus_song_complete")
			timer.one_shot = true
	
func _on_Timer_timeout():
	if note < 6:
		note += 1
		print(note)
		sing()
	
func hide_arrows():
	get_node("HBoxContainer").visible = false
