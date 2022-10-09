extends Node2D


func _ready():
	$PauseMenu.set_pause_mode(2)
	$PauseMenu.visible = false

func _input(event):
	if Input.is_action_pressed("ui_cancel") :
		get_tree().paused = true
		$PauseMenu.visible = true
		


func _on_Resume_pressed():
	$PauseMenu.visible = false
	get_tree().paused = false


func _on_BackToMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Menu.tscn")
