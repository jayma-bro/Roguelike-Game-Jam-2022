extends Area2D

signal send_gravity(gravity)

func _ready():
	self.emit_signal('send_gravity', gravity)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
