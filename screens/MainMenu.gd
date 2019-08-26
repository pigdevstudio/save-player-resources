extends Control

export (String, FILE, "*.tscn") var play_scene

func _ready():
	$AnimationPlayer.play("FadeIn")
	$VBoxContainer/PlayButton.grab_focus()


func _on_PlayButton_button_up() -> void:
	get_tree().change_scene(play_scene)


func _on_QuitButton_button_up():
	get_tree().quit()
