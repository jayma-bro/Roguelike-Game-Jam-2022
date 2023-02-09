extends Control

func _ready():
	Settings.GameSave = Settings.StartSave.duplicate(true)
	Func.SaveGame()

func _on_MenuButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Scenes/Level.tscn")
