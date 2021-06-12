extends Polygon2D

func _on_Option1_mouse_entered():
	$Option1.grab_focus()
	print("option 1 hovered")

func _on_Option2_mouse_entered():
	$Option2.grab_focus()
	print("option 2 hovered")


func _on_Button_pressed():
	print("option 1 clicked")
	return true


func _on_Button2_pressed():
	print("option 2 clicked")
	return false
