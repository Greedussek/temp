extends Control
@export var PlayersInfo : PackedScene

func _on_button_button_down() -> void:
	var controller = get_tree().get_root().find_child("MultiplayeerControler", true, false)  
	if controller != null:  
		
		controller.StartGame.rpc()
	else:
		print("Błąd: MultiplayeerControler nie został znaleziony!")
	pass
	#MultiplayeerControler.StartGame()
	#self.hide()
	 

var player_instances = {}  # Słownik do przechowywania odniesień do graczy

func _process(delta):
	print(GameControl.Players)
	
	# Iteracja przez graczy
	for player_id in GameControl.Players.keys():
		var player_data = GameControl.Players[player_id]  # Pobranie danych gracza
		var player_exists = false  # Flaga sprawdzająca, czy gracz już istnieje
		
		# Sprawdzenie czy gracz już istnieje w kontenerze
		if player_instances.has(player_data["game_id"]):
			player_exists = true
			var player_node = player_instances[player_data["game_id"]]
			player_node.get_node("name").text = player_data["name"]
		
		# Jeśli gracza nie znaleziono, tworzymy nowego
		if not player_exists:
			var currentInfo = PlayersInfo.instantiate()
			currentInfo.name = str(player_data["game_id"])  # Ustawienie nazwy na game_id
			currentInfo.get_node("name").text = player_data["name"]  
			$TeamRed/VBoxContainer.add_child(currentInfo)
			player_instances[player_data["game_id"]] = currentInfo  # Dodajemy do słownika
