extends Control

func _ready():
	PlayerData.connect("updated", self, "update_interface")
	PlayerData.connect("died", self, "_on_player_died")
	
	update_interface()


func update_interface():
	$PlayerHealthBar.max_value = PlayerData.max_health
	$PlayerHealthBar.value = PlayerData.health
	$Score.text = "Score: %s" % PlayerData.score


func _on_player_died():
	get_tree().paused = true
	$ColorRect.show()
	$ColorRect/RetryButton.grab_focus()
	$AnimationPlayer.play("Death")


func _on_RetryButton_button_up() -> void:
	PlayerData.reset()
	get_tree().paused = false
	get_tree().reload_current_scene()
