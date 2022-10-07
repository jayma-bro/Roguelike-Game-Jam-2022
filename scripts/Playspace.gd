extends Node2D


# Declare member variables here. Examples:
const CardBase = preload("res://scripts/CardBase.gd")
const PlayerHand = preload("res://scripts/PlayerHand.gd")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if input
