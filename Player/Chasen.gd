extends KinematicBody2D
class_name Player

const MAX_SPEED = 100

var stats = PlayerStats
var velocity = Vector2.ZERO
var accept_song_input = false
var note = 1

func _ready():
	PlayerStats.connect("no_health", self, "queue_free")
	Global.connect("show_health", self, "show_healthUI")
	Global.connect("hide_health", self, "hide_healthUI")
	Global.connect("bingus_song_complete", self, "song_input")

func _physics_process(_delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")	
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector * MAX_SPEED
	else:
		velocity = Vector2.ZERO
		
	if input_vector.x < 0:
		$Sprite.set_scale(Vector2(-abs($Sprite.get_scale().x), $Sprite.get_scale().y))
	elif input_vector.x > 0:
		$Sprite.set_scale(Vector2(abs($Sprite.get_scale().x), $Sprite.get_scale().y))
		
	velocity = move_and_slide(velocity)
	
func _input(_event):
	if not accept_song_input:
		return
	
	if Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_RIGHT):
		match note:
			1:
				if Input.is_action_just_pressed("note_up"):
					note += 1
					get_node("HBoxContainer/Sprite").visible = true
				else:
					print("wrong note!")
			2:
				if Input.is_action_just_pressed("note_left"):
					note += 1
					get_node("HBoxContainer/Sprite2").visible = true
				else:
					print("wrong note!")
			3:
				if Input.is_action_just_pressed("note_right"):
					note += 1
					get_node("HBoxContainer/Sprite3").visible = true
				else:
					print("wrong note!")
			4:
				if Input.is_action_just_pressed("note_down"):
					note += 1
					get_node("HBoxContainer/Sprite4").visible = true
				else:
					print("wrong note!")
			5:
				if Input.is_action_just_pressed("note_up"):
					get_node("HBoxContainer/Sprite5").visible = true
					accept_song_input = false
					Global.emit_signal("chasen_song_complete")
				else:
					print("wrong note!")

func _on_Hurtbox_area_entered(_area):
	PlayerStats.health -= 1
	print(PlayerStats)
	
func show_healthUI():
	get_node("Camera2D/HealthUI").visible = true
	
func hide_healthUI():
	get_node("Camera2D/HealthUI").visible = false
	
func song_input():
	get_node("HBoxContainer").visible = true
	accept_song_input = true
