extends MarginContainer


# Declare member variables here. Examples:
onready var CardDatabase = preload("res://assets/Cards/CardsDatabase.gd")
var CardName = 'Plateforme'
onready var CardInfo = CardDatabase.DATA[CardDatabase.get(CardName)]
onready var CardImg = str("res://assets/Cards/Values/", CardName,".png")

# Called when the node enters the scene tree for the first time.
func _ready():
	var CardSize:Vector2 = rect_size
	$Border.scale *= CardSize/$Border.texture.get_size()
	$Card.texture = load(CardImg)
	$Card.scale *= CardSize/$Card.texture.get_size()/2
	var Attack = str(CardInfo[1])
	var Cost = str(CardInfo[2])
	$Overlays/TopBar/Name/CenterContainer/name_text.text = CardName
	$Overlays/TopBar/Cost/CenterContainer/cost_text.text = Cost
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
