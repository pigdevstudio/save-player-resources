extends Area2D

func _on_area_entered(coin):
	PlayerData.score += coin.score
	coin.queue_free()
