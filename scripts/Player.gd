extends KinematicBody2D


var move: Vector2 = Vector2.ZERO
export var speed: float = 60
export var gravity: float = 8
export var jump: float = 600
var antdelta: float = 60

func _ready() -> void:
	pass # Replace with function body.


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
	print(move)
	move_and_slide(move * delta * antdelta, Vector2.UP)

func _input(event: InputEvent) -> void:
	pass
