extends Node2D


# Declare member variables here. Examples:
const CardBase = preload("res://prefabs/CardsBase.tscn")
const PlayerHand = preload("res://scripts/PlayerHand.gd")
const CardSize = Vector2(125,175)
var CardSelected = []
onready var DeckSize = PlayerHand.CardList.size()

onready var CenterCardOval = get_viewport().size * Vector2(0.5, 1.25)
onready var Horizontal_radius = get_viewport().size.x*0.45
onready var Vertical_radius = get_viewport().size.y*0.4 
var angle = deg2rad(90) - 0.6
var OvalAngleVector = Vector2()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func drawcard():
	var new_card = CardBase.instance()
	CardSelected = randi() % DeckSize
	new_card.CardName = PlayerHand.CardList[CardSelected]
#	new_card.rect_position = get_global_mouse_position()
	OvalAngleVector = Vector2(Horizontal_radius * cos(angle), - Vertical_radius * sin(angle))
	new_card.rect_position = CenterCardOval + OvalAngleVector - new_card.rect_size/2
	new_card.rect_scale *= CardSize/new_card.rect_size
	new_card.rect_rotation = (90 - rad2deg(angle))/4
	$Cards.add_child(new_card)
	PlayerHand.CardList.erase(PlayerHand.CardList[CardSelected])
	angle += 0.20
	DeckSize -=1
	return DeckSize


