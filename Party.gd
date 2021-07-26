extends Node2D

func _ready():
	get_node("DanceAnimation").play("Dance")
	get_node("FadeInAnimation").play("FadeIn")
