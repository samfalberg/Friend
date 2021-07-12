extends KinematicBody2D
class_name Player

const MAX_SPEED = 100

var stats = PlayerStats
var velocity = Vector2.ZERO

func _ready():
	PlayerStats.connect("no_health", self, "queue_free")
	Global.connect("show_health", self, "show_healthUI")
	Global.connect("hide_health", self, "hide_healthUI")

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

func _on_Hurtbox_area_entered(_area):
	PlayerStats.health -= 1
	print(PlayerStats)
	
func show_healthUI():
	get_node("Camera2D/HealthUI").visible = true
	
func hide_healthUI():
	get_node("Camera2D/HealthUI").visible = false
