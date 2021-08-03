extends KinematicBody2D
class_name Player

const MAX_SPEED = 100

var stats = PlayerStats
var velocity = Vector2.ZERO
var accept_song_input = false
var friending_bingus = false
var friending_rat = false
var note = 1
var rat_song = 0

func _ready():
	Global.connect("show_health", self, "show_healthUI")
	Global.connect("hide_health", self, "hide_healthUI")
	Global.connect("bingus_song_complete", self, "song_input")
	Global.connect("speed_friend_start", self, "brown_rat_friend")

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
		if friending_bingus:	
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
						friending_bingus = false
						Global.emit_signal("chasen_song_complete")
					else:
						print("wrong note!")
		elif friending_rat:
			if Input.is_action_just_pressed("note_up"):
				rat_song += 1
			elif Input.is_action_just_pressed("note_down"):
				rat_song += 1
			elif Input.is_action_just_pressed("note_left"):
				rat_song += 1
			elif Input.is_action_just_pressed("note_right"):
				rat_song += 1
		
			if rat_song > 7:
				Global.brownRatFriended = true
				Global.emit_signal("brown_rat_friended")
				friending_rat = false
				accept_song_input = false
				get_node("SuccessAudio").play()
				yield(get_node("SuccessAudio"), "finished")

func _on_Hurtbox_area_entered(_area):
	PlayerStats.health -= 1
	get_node("HurtAudio").play()
	
func show_healthUI():
	get_node("Camera2D/HealthUI").visible = true
	
func hide_healthUI():
	get_node("Camera2D/HealthUI").visible = false
	PlayerStats.set_health(3)
	
func song_input():
	get_node("HBoxContainer").visible = true
	accept_song_input = true
	friending_bingus = true
	
func brown_rat_friend():
	accept_song_input = true
	friending_rat = true
