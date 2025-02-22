extends Node2D


func _ready() -> void:
		pass
		
	#apply()
	
	# Pobranie ID pierwszego gracza i ustawienie autorytetu
	#if !GameControl.Players.is_empty():
		#var first_player_id = GameControl.Players.keys().front()  # Pobiera pierwszy klucz (ID gracza)
		#$MultiplayerSynchronizer.set_multiplayer_authority(str(first_player_id).to_int())

func apply():
	for i in range(25):
		var node = get_node("Node2D" + str(i + 1))
		if node:
			print(GameControl.Temp)
		#	node.init_data(GameControl.Temp[i], GameControl.Team[i], GameControl.Temp3, i)



func _process(delta):
#	var is_authority = $MultiplayerSynchronizer.get_multiplayer_authority() == multiplayer.get_unique_id()
#	print(is_authority)
#	if is_authority:
		apply()
