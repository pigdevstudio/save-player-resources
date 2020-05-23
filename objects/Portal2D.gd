extends Area2D

export(String, FILE, "*.tscn") var next_scene

func teleport(body):
	$AnimationPlayer.play("FadeOut")
	yield($AnimationPlayer, "animation_finished")
	next_scene = load(next_scene).instance()
	body.get_parent().remove_child(body)
	next_scene.get_node("PlayerContainer").add_child(body)
	next_scene.player = body
	body.owner = next_scene
	body.position = Vector2.ZERO
	var packed_scene = PackedScene.new()
	packed_scene.pack(next_scene)
	get_tree().change_scene_to(packed_scene)


func _on_body_entered(body):
	teleport(body)
