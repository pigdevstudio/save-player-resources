extends Area2D

export (Resource) var player_data

func _on_area_entered(coin):
	player_data.score += coin.score
	coin.queue_free()
