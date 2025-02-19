extends Control

@export var Adress = "192.168.68.109" 
@export var Port = 8910
var peer 

func request_server_name():
	var popup = AcceptDialog.new()
	popup.dialog_text = "Podaj swoją Servera:"
	popup.title  = "Crate Server"
	var line_edit = LineEdit.new()
	popup.add_child(line_edit)
	popup.ok_button_text = "Zapisz"
	popup.confirmed.connect(func():
		_on_host()
		popup.queue_free()
	)
	add_child(popup)
	popup.popup_centered()
	
@rpc("any_peer","call_local")
func StartGame():
	var scen = load("res://Map/map.tscn")  # Load the scene file
	if scen:  # Ensure it's loaded properly
		var instance = scen.instantiate()  # Create an instance
		get_tree().root.add_child(instance)  # Add it to the current scene
	else:
		print("Failed to load scene!")
		
func ListGame():
	var scen = load("res://Server/ServerBrowser.tscn")  # Load the scene file
	if scen:  # Ensure it's loaded properly
		var instance = scen.instantiate()  # Create an instance
		get_tree().root.add_child(instance)  # Add it to the current scene
	else:
		print("Failed to load scene!")

func _on_ready() -> void:
	multiplayer.peer_connected.connect(_on_client_connected)
	multiplayer.peer_disconnected.connect(_on_client_disconnected)
	multiplayer.connected_to_server.connect(_on_connected_to_server)
	multiplayer.connection_failed.connect(_on_connection_failed)

func _on_connection_failed():
	print("connection_failed" )

func _on_connected_to_server():
	print("connected_to_server")
	SendPlayerInformation.rpc_id(1, GameControl.load_player_name(), multiplayer.get_unique_id(),GameControl.load_player_id())

func _on_client_connected(id):
	print("player " + str(id))
	pass
	
func _on_client_disconnected(id):
	print("Gracz rozłączony, ID:" + str(id))

func _on_host():
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(Port, 8)
	if error !=OK:
		print("Błąd: Nie udało się uruchomić serwera.")
		return
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)
	print("weiting for players")
	pass

func _on_join():
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(Adress, Port)
	if error !=OK:
		print("Błąd: Nie udało się uruchomić serwera.")
		return
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)
	print("weiting for players")
	pass

@rpc("any_peer")
func SendPlayerInformation(name, id, game_id):
	if !GameControl.Players.has(id):
		GameControl.Players[id] ={
			"name" : name,
			"id" : id,
			"score": 0,
			"game_id":game_id
		}
	
	if multiplayer.is_server():
		for i in GameControl.Players:
			SendPlayerInformation.rpc(GameControl.Players[i].name, i, 1)
