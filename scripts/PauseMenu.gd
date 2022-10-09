extends VBoxContainer


func _ready():
	set_pause_mode(2)
	visible = false

func _input(event):
	if Input.is_action_just_pressed("ui_cancel") :
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			get_tree().paused = true
			visible = true
		


func _on_Resume_pressed():
	visible = false
	get_tree().paused = false


func _on_BackToMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Menu.tscn")
