extends Node2D

export var CardRange: Array = [2, 3]
export var CardArea: int = 300

var CardBase = preload("res://prefabs/CardsBase.tscn")
var CardList: Array = []

func _ready():
	randomize()
	var numCard = round(rand_range(CardRange[0], CardRange[1]))
	for i in numCard:
		var newCard = CardBase.instance()
		var CardSelected = randi() % Settings.CardsData.size()
		newCard.CardID = CardSelected
		CardList.append(CardSelected)
		newCard.position = Vector2(CardArea*(CardList.size()/(numCard+1)) - CardArea/2, 0)
		add_child(newCard)

func _on_SelectPool_pressed():
	Settings.GameSave.Deck.append_array(CardList)
	Settings.GameSave.Level += 1
	Settings.GameSave.Health += 1
	Func.SaveGame()
	get_tree().change_scene("res://Scenes/Niveau.tscn")
