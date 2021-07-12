extends Friend

const FIREBALL_SCENE = preload("res://Effects/Fireball.tscn")

onready var timer = $Timer
var phase = 0

func _ready():
	Global.connect("fight_start", self, "fight")
	
func fight():
	timer.start()
	var fireball = FIREBALL_SCENE.instance()
	var fireball2 = FIREBALL_SCENE.instance()
	
	match phase:
		0:
			print("Fighting Floppa!")
		1:
			get_parent().add_child(fireball)
			fireball.position = get_node("FireballPos1").global_position
		2:
			get_parent().add_child(fireball)
			fireball.position = get_node("FireballPos2").global_position
		3:
			get_parent().add_child(fireball)
			fireball.position = get_node("FireballPos1").global_position
			get_parent().add_child(fireball2)
			fireball2.position = get_node("FireballPos3").global_position
		4:
			get_parent().add_child(fireball)
			fireball.position = get_node("FireballPos1").global_position
			get_parent().add_child(fireball2)
			fireball2.position = get_node("FireballPos2").global_position
		5:
			get_parent().add_child(fireball)
			fireball.position = get_node("FireballPos2").global_position
			get_parent().add_child(fireball2)
			fireball2.position = get_node("FireballPos3").global_position
		6:
			Global.emit_signal("fight_complete")

func _on_Timer_timeout():
	phase += 1
	fight()
	timer.start()
