extends Node

export var max_health = 3
onready var health = max_health setget set_health

signal health_changed(value)
	
func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		Global.emit_signal("no_health")
