extends Area2D

export (NodePath) var player_data_path

func _on_area_entered(coin):
	var player_data = get_node(player_data_path)
	player_data.score += coin.score
	coin.queue_free()
