extends Node2D


export var HandMax: int = 5
export var PickTime: float = 0.2

# Declare member variables here. Examples:
const CardBase = preload("res://prefabs/CardsBase.tscn")
const CardSize = Vector2(125,175)
var compose: bool = false
var elipsTime: float = 0
var cardCount: int = 0


signal empty_hand()

func _ready():
	get_node("/root/Niveau").connect("start_compose", self, "_start_compose")

func _process(delta):
	if HandMax > cardCount and elipsTime > PickTime and compose:
		drawcard()
		elipsTime = 0
	if Settings.Hand.size() == 0 and cardCount == HandMax:
		emit_signal("empty_hand")
		queue_free()
	elipsTime += delta

func drawcard():
	randomize()
	var new_card = CardBase.instance()
	var CardSelected = randi() % Settings.ActifDeck.size()
	new_card.CardID = Settings.ActifDeck.pop_at(CardSelected)
	Settings.Hand[cardCount] = new_card.CardID
	new_card.CardIndex = cardCount
	new_card.position = Vector2(get_viewport().size.x*(0.85 - (0.7/HandMax)*(cardCount+1)), get_viewport().size.y*0.94)
	add_child(new_card)
	cardCount += 1

func _start_compose():
	compose = true
	elipsTime = 0
