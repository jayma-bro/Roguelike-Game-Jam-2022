extends Node2D


# Declare member variables here. Examples:
const CardBase = preload("res://prefabs/CardsBase.tscn")
const PlayerHand = preload("res://scripts/PlayerHand.gd")
const CardSize = Vector2(125,175)
var CardSelected = []
onready var DeckSize = PlayerHand.CardList.size()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(_event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		var new_card = CardBase.instance()
		CardSelected = randi() % DeckSize
		new_card.CardName = PlayerHand.CardList[CardSelected]
		new_card.rect_position = get_global_mouse_position()
		new_card.rect_scale *= CardSize/new_card.rect_size
		$Cards.add_child(new_card)
		PlayerHand.CardList.erase(PlayerHand.CardList[CardSelected])
		DeckSize -=1
		
		
		
