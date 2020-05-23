extends Area2D

export (NodePath) var player_data_path

func _on_collision_entered(collider):
	get_hurt(collider.damage)


func _on_Invulnerability_timeout():
	$CollisionShape2D.disabled = false


func get_hurt(damage):
	if not $Invulnerability.is_stopped():
		return
	var player_data = get_node(player_data_path)
	player_data.health -= damage
	$CollisionShape2D.call_deferred("set_disabled", true)
	$Invulnerability.start()
	$AnimationPlayer.play("Hurt")
