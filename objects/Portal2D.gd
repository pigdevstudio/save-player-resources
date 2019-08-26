extends Area2D

export(String, FILE, "*.tscn") var next_scene

func teleport():
	$AnimationPlayer.play("FadeOut")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(next_scene)


func _on_body_entered(body):
	teleport()
