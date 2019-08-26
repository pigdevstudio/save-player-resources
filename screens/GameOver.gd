extends Control

export (String, FILE, "*.tscn") var retry_scene
export (Resource) var player_data

func _ready():
	$AnimationPlayer.play("FadeIn")
	$VBoxContainer/RetryButton.grab_focus()
	$VBoxContainer/Score.text = "Score: %s" % player_data.score


func _on_RetryButton_button_up():
	player_data.reset()
	get_tree().change_scene(retry_scene)


func _on_QuitButton_button_up():
	get_tree().quit()
