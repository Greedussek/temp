extends Control

@export var Adress = "192.168.68.108" 
@export var Port = 3000
var names
var peer 

func request_server_name():
	var popup = AcceptDialog.new()
	popup.dialog_text = "Podaj swoją Servera:"
	popup.title  = "Crate Server"
	var line_edit = LineEdit.new()
	popup.add_child(line_edit)
	popup.ok_button_text = "Zapisz"
	popup.confirmed.connect(func():
		names=str(line_edit.text)
		hostGame()
		var scene = load("res://Team/team_view.tscn").instantiate()
		get_tree().root.add_child(scene)
		popup.queue_free()
	)
	add_child(popup)
	popup.popup_centered()
	

func _ready():
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.peer_disconnected.connect(peer_disconnected)
	multiplayer.connected_to_server.connect(connected_to_server)
	multiplayer.connection_failed.connect(connection_failed)
	if "--server" in OS.get_cmdline_args():
		hostGame()
	pass
	
func _process(delta):
	pass

func peer_connected(id):
	print("Player Connected " + str(id))
	
func peer_disconnected(id):
	print("Player Disconnected " + str(id))
	GameControl.Players.erase(id)
func connected_to_server():
	print("connected To Sever!")
	SendPlayerInformation.rpc_id(1, GameControl.load_player_name(),GameControl.load_player_id(),str(multiplayer.get_unique_id()))
func connection_failed():
	print("Couldnt Connect")

@rpc("any_peer","call_local")
func StartGame():
	self.hide()
	var scene = load("res://Map/Map.tscn").instantiate()
	get_tree().root.add_child(scene)
	self.hide()

@rpc("any_peer", "call_local")
func sync_data(new_temp, new_temp2, new_temp3):
	GameControl.Temp = new_temp
	GameControl.Team = new_temp2
	GameControl.Temp3= new_temp3
func hostGame():
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(Port, 8)
	if error != OK:
		print("cannot host: " + error)
		return
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	
	multiplayer.set_multiplayer_peer(peer)
	print("Waiting For Players!")

func _on_start_game_button_down():
	los()
	StartGame.rpc()
	pass # Replace with function body.

func _on_join_button_down():
	JoinByIP(Adress)
	self.hide()
	var scene = load("res://Team/team_view.tscn").instantiate()
	get_tree().root.add_child(scene)
	pass 

@rpc("any_peer")
func los():
	if multiplayer.is_server():
		GameControl.boolenvar()
		GameControl.losuj_slowa()
		GameControl.losuj_card()
		sync_data(GameControl.Temp,GameControl.Team,GameControl.Temp3)
	pass

@rpc("any_peer")
func SendPlayerInformation(name, id, game_id):
	if !GameControl.Players.has(game_id):
		GameControl.Players[game_id] ={
			"name" : name,
			"game_status" : id,
			"game_id":game_id
		}
	
	if multiplayer.is_server():
		for i in GameControl.Players:
			GameControl.start()
			SendPlayerInformation.rpc(GameControl.Players[i].name, 0, 1)
			

func JoinByIP(ip):
	peer = ENetMultiplayerPeer.new()
	peer.create_client(ip, Port)
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)
	
