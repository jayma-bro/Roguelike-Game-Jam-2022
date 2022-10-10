extends Node

var GameSave = {
	"Level": 1,
	"Deck": [0, 0, 0, 3, 3],
	"health": 3
}

var Hand: Dictionary = {}

var ActifDeck: Array = []

const CardsData = [
	{
		'name': 'Plateforme',
		'value': "PF_H_3",
		'type': "Positif",
		'attack': 0,
		'cost': 1
	}, {
		'name': "Monstre",
		'value': "Enemy_Walk",
		'type': "Negatif",
		'attack': 1,
		'cost': 0
	}, {
		'name': "Plateforme\nVertical",
		'value': "PF_V_MV",
		'type': "Netral",
		'attack': 0,
		'cost': 0
		
	}, {
		'name': "Tapis\nRoulants",
		'value': "PF_MV_3",
		'type': "Netral",
		'attack': 0,
		'cost': 0
		
	}
]
