extends MarginContainer


# Declare member variables here. Examples:
export var CardName: int = 0
onready var CardDatabase = preload("res://assets/Cards/CardsDatabase.gd")

onready var CardInfo = CardDatabase.DATA[CardName]
onready var CardFrontImg = str("res://assets/Cards/Values/",CardInfo.type,"/",CardInfo.nom,".png")
onready var CardBorderImg = str("res://assets/Cards/Backgrounds/front/",CardInfo.type,".png")


# Called when the node enters the scene tree for the first time.
func _ready():
	var CardSize = rect_size
	
	$Border.texture = load(CardBorderImg)
	$Border.scale *= CardSize/$Border.texture.get_size()
	
	$Card.texture = load(CardFrontImg)
	$Card.scale *= CardSize/$Card.texture.get_size()
	
#	$ZoomFocus.rect_scale *= CardSize/$ZoomFocus.rect_size
#	var Attack = str(CardInfo.attack)
	$Overlays/TopBar/Name/CenterContainer/name_text.text = CardInfo.nom
	$Overlays/TopBar/Cost/CenterContainer/cost_text.text = str(CardInfo.cost)
	
enum{
	inHand
	focusInHand
	inMouse
}
var state = inHand

func _physics_process(delta):
	match state:
		inHand:
			pass
		focusInHand:
			pass
		inMouse:
			pass



func _on_Focus_mous_entered():
	match state:
		inHand:
			state = focusInHand


func _on_Focus_mous_exited():
	match state:
		focusInHand:
			state = inHand
