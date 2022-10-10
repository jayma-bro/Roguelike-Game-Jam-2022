extends Node2D

export var portalSpeed: int = 100

var TitleShowTime: int = 2
var Timetemps: float = 0
var StartCompose: bool = false
var playerClass = preload("res://prefabs/Player.tscn")
var player = null


signal start_compose()

func _ready():
	$Gravity.visible =  true
	$Title.visible =  true
	Settings.ActifDeck = Settings.GameSave.Deck
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
			_start_compose()

func _start_compose():
	emit_signal("start_compose")
	StartCompose = true
	$DoorEnter.play("Enter")
	player = playerClass.instance()
	add_child(player)
	player.position = Vector2(32, 336)



func _on_empty_hand():
	$Play.disabled = false
