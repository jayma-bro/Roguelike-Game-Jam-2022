extends Node2D


# Declare member variables here. Examples:
export var CardIndex: int = 0
export var FocusUp: float = 50
export var Grid: int = 16
export var BordPlace: int = 448



onready var CardInfo = Settings.CardsData[CardIndex]
onready var CardFrontImg = str("res://assets/Cards/Values/",CardInfo.value,".png")
onready var CardBorderImg = str("res://assets/Cards/Backgrounds/front/",CardInfo.type,".png")
onready var CardEffect = load(str("res://prefabs/CardEffect/",CardInfo.value,".tscn"))
onready var effect: Node = CardEffect.instance()

var CardSize: Vector2 = Vector2.ZERO
var vanillaPosition: Vector2 = Vector2.ONE
var ValidPlace: bool = false
enum{
	inHand
	focusInHand
	inMouse
}
var state = inHand


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(effect)
	effect.connect('valid_place', self, '_is_valid_place')
	effect.hide()
	CardSize = $CardFormat.rect_size
	vanillaPosition = position
	
	$Border.texture = load(CardBorderImg)
	$Border.scale = CardSize/$Border.texture.get_size()
	
	$Card.texture = load(CardFrontImg)
	$Card.scale = CardSize/$Card.texture.get_size()
	
	$Name.text = CardInfo.name
	$Cost.text = str(CardInfo.cost)


func _process(delta):
	match state:
		inHand:
			z_index = 0
			position = vanillaPosition
		focusInHand:
			z_index = 10
			position = vanillaPosition - Vector2(0, FocusUp)
		inMouse:
			if position.y > BordPlace:
				position = get_global_mouse_position()
			else:
				position = GridPos()
	if state == inMouse and position.y < BordPlace:
		effect.show()
		$Card.hide()
		$Border.hide()
		$Name.hide()
		$Cost.hide()
	else: 
		effect.hide()
		$Card.show()
		$Border.show()
		$Name.show()
		$Cost.show()

func GridPos() -> Vector2:
	return Vector2(Grid * round(get_global_mouse_position().x / Grid), Grid * round(get_global_mouse_position().y / Grid))

func _is_valid_place(valid: bool):
	ValidPlace = valid

func _on_mouse_entered():
	state = focusInHand

func _on_mouse_exited():
	state = inHand


func _on_CardFormat_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			state = inMouse
		elif state == inMouse:
			if position.y > BordPlace or !ValidPlace: 
				state = inHand
			else:
				var globalEffect = CardEffect.instance()
				get_node("/root/Niveau").add_child(globalEffect)
				globalEffect.position = GridPos()
				queue_free()

