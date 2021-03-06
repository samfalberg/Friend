extends Friend

const FIREBALL_SCENE = preload("res://Effects/Fireball.tscn")

onready var timer = $Timer
var phase = 0

func _ready():
	Global.connect("fight_start", self, "fight")
	Global.connect("no_health", self, "game_over")
	
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
			get_node("AudioStreamPlayer").play()
		2:
			get_parent().add_child(fireball)
			fireball.position = get_node("FireballPos2").global_position
			get_node("AudioStreamPlayer").play()
		3:
			get_parent().add_child(fireball)
			fireball.position = get_node("FireballPos1").global_position
			get_parent().add_child(fireball2)
			fireball2.position = get_node("FireballPos3").global_position
			get_node("AudioStreamPlayer").play()
		4:
			get_parent().add_child(fireball)
			fireball.position = get_node("FireballPos1").global_position
			get_parent().add_child(fireball2)
			fireball2.position = get_node("FireballPos2").global_position
			get_node("AudioStreamPlayer").play()
		5:
			get_parent().add_child(fireball)
			fireball.position = get_node("FireballPos2").global_position
			get_parent().add_child(fireball2)
			fireball2.position = get_node("FireballPos3").global_position
			get_node("AudioStreamPlayer").play()
		6:
			Global.emit_signal("fight_complete")
			timer.stop()
			phase = 0
			
func game_over():
	phase = 5
	Global.floppaGameOver = true

func _on_Timer_timeout():
	phase += 1
	fight()
