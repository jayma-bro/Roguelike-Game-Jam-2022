extends StaticBody2D

export var actif: bool = false
export var speed: float = 10

func _ready() -> void:
	get_tree().get_root().get_node('Niveau/Play').connect("pressed", self, "Play")
	$AnimatedSprite.play("default")
	$AnimatedSprite2.play("default")
	$AnimatedSprite3.play("default")

func Play():
	actif = true
