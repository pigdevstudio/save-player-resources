extends Control

export (Resource) var player_data

func _ready():
	player_data.connect("updated", self, "update_interface")
	player_data.connect("died", self, "_on_player_died")
	
	update_interface()


func update_interface():
	$PlayerHealthBar.max_value = player_data.max_health
	$PlayerHealthBar.value = player_data.health
	$Score.text = "Score: %s" % player_data.score


func _on_player_died():
	get_tree().paused = true
	$ColorRect.show()
	$ColorRect/RetryButton.grab_focus()
	$AnimationPlayer.play("Death")


func _on_RetryButton_button_up() -> void:
	player_data.reset()
	get_tree().paused = false
	get_tree().reload_current_scene()
