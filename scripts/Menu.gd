extends Control



func _ready():
	Settings.GameSave = Func.LoadGame()
	if Settings.GameSave.Level == 1:
		$Buttons/Continue.visible = false

func _on_Continue_pressed():
	get_tree().change_scene("res://Scenes/Niveau.tscn")

func _on_Start_pressed():
	Settings.GameSave = Settings.StartSave.duplicate()
	Func.SaveGame()
	get_tree().change_scene("res://Scenes/Niveau.tscn")

func _on_Options_pressed():
	get_tree().change_scene("res://Scenes/Options.tscn")

func _on_Quit_pressed():
	get_tree().quit()


