extends Area2D

export var interaction_parent : NodePath

signal on_interactable_changed(newInteractable)

var interaction_target : Node
const BINGUS_DIALOGUE = preload("res://Dialogue/BingusDialogue.tscn")
const FLOPPA_DIALOGUE = preload("res://Dialogue/FloppaDialogue.tscn")
const LANEY_DIALOGUE = preload("res://Dialogue/LaneyDialogue.tscn")
const HARROW_DIALOGUE = preload("res://Dialogue/HarrowDialogue.tscn")
const CARTER_DIALOGUE = preload("res://Dialogue/CarterDialogue.tscn")

# Called every frame
func _process(_delta):
	# Check whether the player is trying to interact
	if (interaction_target != null and Input.is_action_just_pressed("Interact")):
		# If so, we'll call interaction_interact() if our target supports it
		if (interaction_target is Friend):
			get_node("InteractAudio").play()
			yield(get_node("InteractAudio"), "finished")
			get_tree().paused = true # Prevent player from moving during dialogue
			get_node("EndInteractionAudio").play()
			match interaction_target.name:
				"Bingus":
					var dialogue = BINGUS_DIALOGUE.instance()
					get_parent().get_parent().get_child(2).add_child(dialogue)
				"Floppa":
					var dialogue = FLOPPA_DIALOGUE.instance()
					get_parent().get_parent().get_child(2).add_child(dialogue)
				"Laney": 
					var dialogue = LANEY_DIALOGUE.instance()
					get_parent().get_parent().get_child(2).add_child(dialogue)
				"Harrow":
					var dialogue = HARROW_DIALOGUE.instance()
					get_parent().get_parent().get_child(2).add_child(dialogue)
				"Carter":
					var dialogue = CARTER_DIALOGUE.instance()
					get_parent().get_parent().get_child(2).add_child(dialogue)

# Signal triggered when our collider collides with something on the interaction layer
func _on_InteractionComponent_body_entered(body):
	var canInteract := false
	
	# GDScript lacks the concept of interfaces, so we can't check whether the body implements an interface
	# Instead, we'll see if it has the methods we need
	if (body.has_method("interaction_can_interact")):
		# Interactables tell us whether we're allowed to interact with them.
		canInteract = body.interaction_can_interact(get_node(interaction_parent))
	
	if not canInteract:
		return
		
	# Store the thing we'll be interacting with, so we can trigger it from _process
	interaction_target = body
	emit_signal("on_interactable_changed", interaction_target)


func _on_InteractionComponent_body_exited(body):
	if (body == interaction_target):
		interaction_target = null
		emit_signal("on_interactable_changed", null)
