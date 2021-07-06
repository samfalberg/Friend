extends KinematicBody2D
class_name Friend

var interaction_stage = 0

func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player
