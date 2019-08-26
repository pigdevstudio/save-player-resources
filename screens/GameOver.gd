extends Control

export (String, FILE, "*.tscn") var retry_scene

func _ready():
	$AnimationPlayer.play("FadeIn")
	$VBoxContainer/RetryButton.grab_focus()
	$VBoxContainer/Score.text = "Score: %s" % PlayerData.score


func _on_RetryButton_button_up():
	PlayerData.reset()
	get_tree().change_scene(retry_scene)


func _on_QuitButton_button_up():
	get_tree().quit()
