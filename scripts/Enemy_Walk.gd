extends KinematicBody2D

export var hitStr: float = 40
export var hitDecrece: float = 0.3
export var speed: float = 5
export var jump: float = 35


var antdelta: float = 960
var gravity: float = 0

var hitVect: Vector2 = Vector2.ZERO
var hitPwr = 0
var hit: bool = false

var move: Vector2 = Vector2.ZERO

func _ready():
	$AnimatedSprite.play("default")
	

func _process(delta: float) -> void:
	Move(delta)
#	pass

	
func Gravitation(moveY: float) -> float:
	if is_on_floor() and moveY > 10:
		moveY = 10
	else:
		moveY += gravity
	if is_on_ceiling():
		moveY = gravity
	return moveY

func Move(delta) -> Vector2:
	if self.get_parent().get_node('Player').position > position:
		move.x = 1
	else:
		move.x = -1
	move.x *= speed
	if is_on_wall() and !hit and is_on_floor():
		move.y = -jump
	move.x += hitVect.x * hitPwr
	if hitPwr > 0:
		hitPwr -= hitDecrece * delta * antdelta
		if hitPwr < 0:
			hitPwr = 0
	move.y = Gravitation(move.y)
	return move_and_slide(move * delta * antdelta, Vector2.UP)

func _on_Gravity_send_gravity(generalGravity):
	self.gravity = generalGravity


func Contact(area: Area2D):
	if area.name == "HitBox":
		hitVect = (position - area.get_parent().position).normalized()
		hitPwr = hitStr / 3
		move.y = hitVect.y * hitPwr / 1.5
		hit = true


func end_Contact(area):
	if area.name == "HitBox":
		hit = false
