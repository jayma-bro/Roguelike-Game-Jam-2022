extends TextureButton


# Declare member variables here. Examples:
var DeckSize = INF


# Called when the node enters the scene tree for the first time.
func _ready():
	rect_scale *= $'../../'.CardSize/rect_size


func _gui_input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if DeckSize > 0:
			DeckSize = $'../../'.drawcard()
			if DeckSize == 0:
				disabled = true
