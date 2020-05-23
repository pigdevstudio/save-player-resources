extends Node2D

func _ready():
	get_parent().player = get_child(0)
