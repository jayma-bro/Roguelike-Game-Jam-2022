extends Control

var StartSave = Settings.GameSave.duplicate()
var save_file = File.new()


func _ready():
	if not save_file.file_exists("user://savegame.save"):
		save_file.open("user://savegame.save", File.WRITE)
		save_file.store_string(to_json(Settings.GameSave))
	else:
		save_file.open("user://savegame.save", File.READ)
		Settings.GameSave = parse_json(save_file.get_as_text())
	save_file.close()
	print(Settings.GameSave)
	if Settings.GameSave.Level == 1:
		$Buttons/Continue.visible = false
	

func _on_Continue_pressed():
	get_tree().change_scene("res://Scenes/Niveau.tscn")

func _on_Start_pressed():
	Settings.GameSave = StartSave
	save_file.open("user://savegame.save", File.WRITE)
	save_file.store_string(to_json(StartSave))
	save_file.close()
	get_tree().change_scene("res://Scenes/Niveau.tscn")


func _on_Options_pressed():
	get_tree().change_scene("res://Scenes/Options.tscn")
	
	
func _on_Quit_pressed():
	get_tree().quit()


