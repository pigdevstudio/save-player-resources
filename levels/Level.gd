extends Node2D

var player

func _ready():
	if player:
		$Interface/UserInterface.player_data = player.get_node("PlayerData")
		$Interface/UserInterface.setup()
