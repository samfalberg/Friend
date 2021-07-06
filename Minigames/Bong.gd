extends Control

signal bong_ripped

func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		get_node("TextureProgress").value += 10
		if get_node("TextureProgress").value == 100:
			get_node("Label").visible = true
			emit_signal("bong_ripped")
