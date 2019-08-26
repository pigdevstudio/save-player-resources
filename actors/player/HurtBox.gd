extends Area2D


func _on_collision_entered(collider):
	get_hurt(collider.damage)


func _on_Invulnerability_timeout():
	$CollisionShape2D.disabled = false


func get_hurt(amount):
	if not $Invulnerability.is_stopped():
		return
	$CollisionShape2D.call_deferred("set_disabled", true)
	$Invulnerability.start()
	$AnimationPlayer.play("Hurt")
