extends Node
const PORT = 9999
var peer = ENetMultiplayerPeer.new()
var players = []
var SERVER_NAME =""
func _ready():
	pass
func start_server():
	var err = peer.create_server(PORT,12)
	if err !=OK:
		print("Błąd: Nie udało się uruchomić serwera.")
		return
	multiplayer.multiplayer_peer = peer
	print("Serwer uruchomiony na porcie", PORT)
	multiplayer.peer_connected.connect(_on_client_connected)
	multiplayer.peer_disconnected.connect(_on_client_disconnected)
	var udp = PacketPeerUDP.new()
	udp.set_broadcast_enabled(true)
	var timer = Timer.new()
	timer.wait_time = 2.0  # Ogłaszamy serwer co 2 sekundy
	timer.autostart = true
	get_tree().change_scene_to_file("res://Connecting_UI.tscn") 
	timer.timeout.connect(func():
		udp.put_packet(SERVER_NAME.to_utf8_buffer())
		)
	add_child(timer)
	
func _on_client_connected(id):
	print("Gracz dołączył, ID:", id)
	var team = "blue" if players.size() % 2 == 0 else "red"
	players.append({ "id": id, "team": team })
	update_lobby.rpc(players)  

@rpc("authority", "call_local")
func update_lobby(server_players):
	players = server_players
	$"../ConnectingUi".update_player_list()  


func _on_client_disconnected(id):
	print("Gracz rozłączony, ID:", id)
	players.erase(id)
 # Serwer startuje grę
