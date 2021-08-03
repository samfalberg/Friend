extends KinematicBody2D

var drag_enabled = false
var cheese_drag = false

func _ready():
	Global.connect("speed_friend_start", self, "allow_cheese_drag")

func _physics_process(_delta):
	var movement = Vector2.ZERO
	
	if drag_enabled:
		var new_position = get_global_mouse_position()
		new_position.x = new_position.x - 10
		new_position.y = new_position.y - 80
		movement = new_position - position
	
	move_and_collide(movement)
			
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			drag_enabled = false

func _on_Cheese_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and cheese_drag:
		if event.button_index == BUTTON_LEFT:
			drag_enabled = event.pressed
			
func allow_cheese_drag():
	cheese_drag = true

func _on_Area2D_area_entered(area):
	area.get_parent().get_child(1).visible = true
	Global.whiteRatFriended = true
	get_node("AudioStreamPlayer").play()
	yield(get_node("AudioStreamPlayer"), "finished")
	queue_free()
