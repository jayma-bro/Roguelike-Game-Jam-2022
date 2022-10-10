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
	Settings.ActifDeck = Settings.GameSave.Deck.duplicate()
	$Title.text = "Niveau " + str(Settings.GameSave.Niveau)

func _process(delta: float):
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
	$DoorEnter/DoorEnterSpriteBack.play("Enter")
	$DoorEnter/DoorEnterSpriteFront.play("Enter")
	player = playerClass.instance()
	add_child(player)
	player.connect("end_lvl", self, "_end_lvl")

func _end_lvl():
	$Label.visible = true

func _on_empty_hand():
	print('pas pressé')
	$Play.disabled = false

func _on_Play_pressed():
	print('pressé')
	$Play.disabled = true
