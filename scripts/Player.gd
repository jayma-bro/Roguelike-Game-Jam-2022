extends KinematicBody2D


var move: Vector2 = Vector2.ZERO
export var speed: float = 12.5
export var gravity: float = 2
export var jump: float = 35

var antdelta: float = 960
var hitVect: Vector2 = Vector2.ZERO
var hitPwr: float = 0
var hitDecrece: float = 0
var hitSrt: float = 0

func _ready() -> void:
	$AnimatedSprite.play("default")


func _process(delta: float) -> void:
	move.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	move.x *= speed
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			move.y = -jump
		else:
			move.y = 10
	else:
		move.y += gravity
	if is_on_ceiling():
		move.y = gravity
	move.x += hitVect.x * hitPwr
	if hitPwr > 0:
		hitPwr -= hitDecrece * delta * antdelta
	else:
		hitPwr = 0
	move_and_slide(move * delta * antdelta, Vector2.UP)
	

func _input(event: InputEvent) -> void:
	pass


func Contact(area: Area2D):
	print(area.name)
	if area.name == "Enemy_Walk":
		hitVect = (position - area.position).normalized()
		hitPwr = area.hitSrt
		hitDecrece = area.hitDecrece
		move.y = hitVect.y * hitPwr / 1.5


