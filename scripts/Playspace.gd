extends Node2D


export var HandMax: int = 8
export var PickTime: float = 0.2

# Declare member variables here. Examples:
const CardBase = preload("res://prefabs/CardsBase.tscn")
const CardSize = Vector2(125,175)
var compose: bool = false
var elipsTime: float = 0

func _ready():
	get_node("/root/Niveau").connect("start_compose", self, "_start_compose")

func _process(delta):
	if HandMax > Settings.Hand.size() and elipsTime > PickTime and compose:
		drawcard()
		elipsTime = 0
	elipsTime += delta

func drawcard():
	randomize()
	var new_card = CardBase.instance()
	var CardSelected = randi() % Settings.ActifDeck.size()
	new_card.CardIndex = Settings.ActifDeck.pop_at(CardSelected)
	Settings.Hand.append(new_card.CardIndex)
	new_card.position = Vector2(get_viewport().size.x*(0.8 - (0.6/HandMax)*Settings.Hand.size()), get_viewport().size.y*0.94)
	$Cards.add_child(new_card)

func _start_compose():
	compose = true
	elipsTime = 0
