extends Area2D

export(int) var score = 100

func queue_free():
	$Geometry2D.call_deferred("set_disabled", true)
	$Tween.interpolate_property(self, "position", position,
			position + Vector2(0, -50), 0.25, Tween.TRANS_BACK, Tween.EASE_IN)
	
	var transparent = modulate
	transparent.a = 0.0
	$Tween.interpolate_property(self, "modulate", modulate,
			transparent, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	yield($Tween, "tween_completed")
	.queue_free()
