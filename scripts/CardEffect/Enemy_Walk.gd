extends KinematicBody2D

export var hitStr: float = 40
export var hitDecrece: float = 0.3
export var speed: float = 5
export var jump: float = 35
export var actif: bool = false


var antdelta: float = 960
var gravity: float = 0

var hitVect: Vector2 = Vector2.ZERO
var hitPwr = 0
var hit: bool = false
var ValidPlace: bool = true

signal valid_place(valid)

var move: Vector2 = Vector2.ZERO

func _ready():
	gravity = get_node('/root/Level/Gravity').gravity
	get_node('/root/Level/Play').connect("pressed", self, "Play")
	$AnimatedSprite.play("default")


func _process(delta: float) -> void:
	if actif:
		Move(delta)
	else:
		if ($SlotArea.get_overlapping_areas().size() > 1 or $SlotArea.get_overlapping_bodies().size() > 0):
			if ValidPlace:
				ValidPlace = false
				emit_signal("valid_place", ValidPlace)
				$AnimatedSprite.modulate = Color('ff5050')
		else:
			if !ValidPlace:
				ValidPlace = true
				emit_signal("valid_place", ValidPlace)
				$AnimatedSprite.modulate = Color('ffffff')
	Animate()


func Animate() -> void:
	if move.x > 0:
		$AnimatedSprite.flip_h = true
	elif move.x < 0:
		$AnimatedSprite.flip_h = false
	if !is_on_floor() and actif:
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

func Move(delta) -> Vector2:
	if get_node('/root/Level/Player').position > position:
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

func Play():
	actif = true
	$CollisionShape2D.disabled = false
	$HitArea.monitorable = true
	$HitArea.monitoring = true

func Contact(area: Area2D):
	if area.name == "HitBox":
		hitVect = (position - area.get_parent().position).normalized()
		hitPwr = hitStr / 3
		move.y = hitVect.y * hitPwr / 1.5
		hit = true


func end_Contact(area):
	if area.name == "HitBox":
		hit = false
