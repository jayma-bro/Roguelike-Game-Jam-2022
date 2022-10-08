extends MarginContainer


# Declare member variables here. Examples:
export var CardName: int = 0
onready var CardDatabase = preload("res://assets/Cards/CardsDatabase.gd")

onready var CardInfo = CardDatabase.DATA[CardName]
onready var CardImg = str("res://assets/Cards/Values/", CardInfo.nom,".png")



# Called when the node enters the scene tree for the first time.
func _ready():
	var CardSize = rect_size
	$Border.scale *= CardSize/$Border.texture.get_size()
	$Card.texture = load(CardImg)
	$Card.scale *= CardSize/$Card.texture.get_size()/2
#	var Attack = str(CardInfo.attack)
	var Cost = str(CardInfo.cost)
	$Overlays/TopBar/Name/CenterContainer/name_text.text = CardInfo.nom
	$Overlays/TopBar/Cost/CenterContainer/cost_text.text = Cost
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
