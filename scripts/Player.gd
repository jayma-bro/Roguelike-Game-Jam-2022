extends KinematicBody2D


var move: Vector2 = Vector2.ZERO
export var speed: float = 12.5
export var jump: float = 35
var gravity: float = 0

var antdelta: float = 960
var hitVect: Vector2 = Vector2.ZERO
var hitPwr: float = 0
var hitDecrece: float = 0
var hit: bool = false
var push: float = 0
var last_contact: String = ""

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	Move(delta)
	Animation()
	if last_contact == 'PF_MV_3':
		move.x += push
	move_and_slide(move * delta * antdelta, Vector2.UP)


func _input(event: InputEvent) -> void:
	pass

func Animation() -> void:
	if move.x > 0:
		$AnimatedSprite.flip_h = false
	elif move.x < 0:
		$AnimatedSprite.flip_h = true
	if !is_on_floor():
		$AnimatedSprite.play("Jump")
	elif move.x != 0:
		$AnimatedSprite.play("Run")
	else:
		$AnimatedSprite.play("Idle")

func Gravitation(moveY: float) -> float:
	if is_on_floor() and moveY > 10:
		moveY = 10
	else:
		moveY += gravity
	if is_on_ceiling():
		moveY = gravity
	return moveY

func Move(delta) -> void:
	move.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	move.x *= speed
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			move.y = -jump
	move.x += hitVect.x * hitPwr
	if hitPwr > 0:
		hitPwr -= hitDecrece * delta * antdelta
		if hitPwr < 0:
			hitPwr = 0
	move.y = Gravitation(move.y)


func Contact(area: Area2D) -> void:
	if area.name == "HitArea":
		hitVect = (position - area.get_parent().position).normalized()
		hitPwr = area.get_parent().hitStr
		hitDecrece = area.get_parent().hitDecrece
		move.y = hitVect.y * hitPwr / 1.5


func _on_Gravity_send_gravity(generalGravity) -> void:
	self.gravity = generalGravity


func Contact_node(body: Node) -> void:
	last_contact = body.name
	if body.name == "PF_MV_3":
		push = body.speed


