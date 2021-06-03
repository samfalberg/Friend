extends Friend

func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player

#func interaction_get_text() -> String:
#	return "Open"
