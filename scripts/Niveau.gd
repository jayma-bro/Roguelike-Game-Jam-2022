extends Node2D


var TitleShowTime: int = 2
var Timetemps: float = 0
var StartCompose: bool = false

signal start_compose()

func _ready():
	$Title.text = "Niveau " + str(Settings.GameSave.Niveau)

func _process(delta):
	if Timetemps < TitleShowTime/2:
		$Title.percent_visible = Timetemps / (TitleShowTime/2)
		Timetemps += delta
	elif Timetemps < TitleShowTime:
		$Title.percent_visible = 1
		Timetemps += delta
	else:
		$Title.percent_visible = 0
		if !StartCompose:
			StartCompose = true
			emit_signal("start_compose")

