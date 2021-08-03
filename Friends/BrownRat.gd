extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("brown_rat_friended", self, "show_heart")

func show_heart():
	get_node("HeartSprite").visible = true
