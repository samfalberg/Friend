extends KinematicBody2D
class_name Player

const MAX_SPEED = 100

var velocity = Vector2.ZERO

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
