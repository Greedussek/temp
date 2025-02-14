extends Control

@onready var team_blue_list = $Container
@onready var team_red_list = $Container2
@onready var start_button = $Button

var players = {}  # Słownik graczy, { id: { "name": "GraczX", "team": "blue/red" } }

func _on_ready():
	if multiplayer.is_server():
		multiplayer.peer_connected.connect(_on_client_connected)
		multiplayer.peer_disconnected.connect(_on_client_disconnected)
	start_button.pressed.connect(_on_start_pressed)
	update_player_list()

@rpc("any_peer", "call_local")
func update_player_list():
	# Wyczyść stare listy
	for child in team_blue_list.get_children():
		team_blue_list.remove_child(child)
		child.queue_free()
	
	for child in team_red_list.get_children():
		team_red_list.remove_child(child)
		child.queue_free()

	# Dodaj graczy do odpowiednich list
	for player_id in players:
		var player_data = players[player_id]
		var label = Label.new()
		label.text = player_data["name"] + " (ID: " + str(player_id) + ")"
		
		if player_data["team"] == "blue":
			team_blue_list.add_child(label)
		else:
			team_red_list.add_child(label)

func _on_client_connected(id):
	print("Gracz dołączył, ID:", id)
	# Przydziel gracza do drużyny
	var team = "blue" if players.size() % 2 == 0 else "red"
	players[id] = { "name": "Gracz" + str(id), "team": team }
	update_player_list.rpc()  # Synchronizacja z klientami

func _on_client_disconnected(id):
	print("Gracz rozłączony, ID:", id)
	players.erase(id)
	update_player_list.rpc()

func _on_start_pressed():
	if players.size() >= 4 and multiplayer.is_server():
		start_game.rpc()  # Start gry dla wszystkich

@rpc("authority")
func start_game():
	print("Start gry!")
	get_tree().change_scene_to_file("res://game_scene.tscn")
