extends Area2D

export var hitSrt: float = 40
export var hitDecrece: float = 0.5

func _ready():
	$AnimatedSprite.play("default")

