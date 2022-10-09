extends Node2D


export var HandMax = 8

# Declare member variables here. Examples:
const CardBase = preload("res://prefabs/CardsBase.tscn")
onready var CardDatabase = preload("res://scripts/CardsDatabase.gd")
const CardSize = Vector2(125,175)
var CardSelected = []
onready var DeckSize = CardDatabase.DeckCards.size()
var HandSize = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func drawcard():
	if HandMax > HandSize:
		randomize()
		var new_card = CardBase.instance()
		CardSelected = randi() % DeckSize
		new_card.CardName = CardDatabase.DeckCards[CardSelected]
		new_card.position = Vector2(get_viewport().size.x*(0.8 - (0.6/HandMax)*HandSize), get_viewport().size.y*0.94)
		$Cards.add_child(new_card)
		CardDatabase.DeckCards.erase(CardDatabase.DeckCards[CardSelected])
		HandSize += 1
		DeckSize -= 1
	return DeckSize


