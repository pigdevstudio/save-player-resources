extends Node

signal updated
signal died

export (int) var max_health = 10 setget set_max_health
export (int) var health = max_health setget set_health
export (int) var score = 0 setget set_score

func _ready():
	set_health(max_health)


func reset():
	health = max_health
	score = 0
	emit_signal("updated")


func set_max_health(new_max_health):
	max_health = new_max_health
	emit_signal("updated")


func set_health(new_health):
	health = clamp(new_health, 0, max_health)
	if health < 1:
		emit_signal("died")
	emit_signal("updated")


func set_score(new_score):
	score = new_score
	emit_signal("updated")
