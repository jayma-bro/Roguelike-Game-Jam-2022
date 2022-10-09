extends Node2D

export var GameSave = {}
var save_file = File.new()

var TitleShowTime: int = 2
var Timetemps: float = 0

func _ready():
	save_file.open("user://savegame.save", File.READ)
	GameSave = parse_json(save_file.get_as_text())
	save_file.close()
	$Title.text = "Niveau " + str(GameSave.Niveau)

func _process(delta):
	if Timetemps < TitleShowTime/2:
		$Title.percent_visible = Timetemps/ (TitleShowTime/2)
		Timetemps += delta
	elif Timetemps < TitleShowTime:
		$Title.percent_visible = 1
		Timetemps += delta
	else:
		$Title.percent_visible = 0
