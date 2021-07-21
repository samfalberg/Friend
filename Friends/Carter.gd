extends Friend

func _process(_delta):
	if Global.whiteRatFriended && Global.brownRatFriended && Global.greyRatFriended && not Input.is_mouse_button_pressed(1):
		Global.emit_signal("speed_friend_complete")
