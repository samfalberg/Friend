extends KinematicBody2D
class_name Friend

func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player
