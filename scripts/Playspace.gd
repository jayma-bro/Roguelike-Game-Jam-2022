extends Node2D


export var HandMax = 8

# Declare member variables here. Examples:
const CardBase = preload("res://prefabs/CardsBase.tscn")
const CardSize = Vector2(125,175)
var CardSelected = []
onready var DeckSize = Settings.GameSave.Deck.size()

func drawcard():
	while HandMax > HandSize:
		randomize()
		var new_card = CardBase.instance()
		CardSelected = randi() % DeckSize
		new_card.CardName = Settings.GameSave.Deck[CardSelected]
		new_card.position = Vector2(get_viewport().size.x*(0.8 - (0.6/HandMax)*HandSize), get_viewport().size.y*0.94)
		$Cards.add_child(new_card)
		HandSize += 1
		DeckSize -= 1


