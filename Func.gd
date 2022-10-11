extends Node

func LoadGame() -> Dictionary:
	var save_file = File.new()
	var save: Dictionary = {}
	if not save_file.file_exists("user://savegame.save"):
		save_file.open("user://savegame.save", File.WRITE)
		save_file.store_string(to_json(Settings.StartSave))
		save = Settings.StartSave.duplicate()
	else:
		save_file.open("user://savegame.save", File.READ)
		save = parse_json(save_file.get_as_text())
	save_file.close()
	return save

func SaveGame() -> void:
	var save_file = File.new()
	save_file.open("user://savegame.save", File.WRITE)
	save_file.store_string(to_json(Settings.GameSave))
	save_file.close()
