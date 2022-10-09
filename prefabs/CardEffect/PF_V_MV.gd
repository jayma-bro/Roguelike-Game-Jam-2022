extends KinematicBody2D

export var speed: float = 30
export var actif: bool = false

var goLeft = false
var ValidPlace: bool = true
signal valid_place(valid)


var move: Vector2 = Vector2(speed, 0)


func _ready() -> void:
	get_tree().get_root().get_node('Niveau/Play').connect("pressed", self, "Play")
	$AnimatedSprite.play("default")
	

func _process(delta: float) -> void:
	if !actif:
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
	else:
		Move(delta)


func Play():
	actif = true
	$CollisionShape2D.disabled = false
	



func Move(delta) -> Vector2:
	if is_on_wall():
		if goLeft :
			move.x = speed
			goLeft = false
			$AnimatedSprite.flip_h = false
		else:
			move.x = -speed
			goLeft = true
			$AnimatedSprite.flip_h = true
#	else:
#		if  goLeft:
#			move.x = -1
#			goLeft = true
#			$AnimatedSprite.flip_h = true
#		else:
#			move.x = 1
#			goLeft = false
#			$AnimatedSprite.flip_h = false
		
	return move_and_slide(move , Vector2.UP)
