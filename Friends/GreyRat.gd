extends StaticBody2D

var can_friend = false
var mouse_on_rat = false
var clicks = 0

func _ready():
	Global.connect("speed_friend_start", self, "allow_friending")
	
func allow_friending():
	can_friend = true

func _on_GreyRat_mouse_entered():
	mouse_on_rat = true

func _on_GreyRat_mouse_exited():
	mouse_on_rat = false

func _input(_event):
	if Input.is_mouse_button_pressed(1) && can_friend && mouse_on_rat:
		clicks += 1
		if clicks == 8:
			Global.greyRatFriended = true
			get_node("AudioStreamPlayer").play()
			yield(get_node("AudioStreamPlayer"), "finished")
