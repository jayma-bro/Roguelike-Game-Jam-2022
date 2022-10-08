extends TextureButton


# Declare member variables here. Examples:
var DeckSize = INF


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _gui_input(event):
	if Input.is_action_just_pressed("ui_select"):
		if DeckSize > 0:
			DeckSize = $'../../'.drawcard()
			if DeckSize == 0:
				disabled = true
