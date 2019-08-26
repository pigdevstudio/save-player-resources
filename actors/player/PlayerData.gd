extends Node

signal updated
signal died

export (int) var max_health = 10 setget set_max_health
export (int) var health = max_health setget set_health
export (int) var score = 0 setget set_score

func _ready():
	set_health(max_health)
	load_data()


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


func save_data():
	var dictionary = {
			"health": health, 
			"max_health": max_health,
			"score": score
			}
	var file = File.new()
	file.open_encrypted_with_pass("user://save.json", File.WRITE,
		 "player-01")
	file.store_string(to_json(dictionary))
	file.close()


func load_data():
	var file = File.new()
	if not file.file_exists("user://save.json"):
		return
	
	file.open_encrypted_with_pass("user://save.json", File.READ,
		 "player-01")
	
	var dictionary = parse_json(file.get_as_text())
	health = dictionary["health"]
	max_health = dictionary["max_health"]
	score = dictionary["score"]
