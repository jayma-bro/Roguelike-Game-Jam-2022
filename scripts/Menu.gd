extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	pass

# Called when the node enters the scene tree for the first time.
func _on_StartButton_pressed():
		get_tree().change_scene("res://Scenes/Niveau.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
