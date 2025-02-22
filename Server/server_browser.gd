extends Control

signal found_server
signal server_removed
var servername
signal joinGame(ip)
var broadcastTimer : Timer
var temp = false

var RoomInfo = {"name":"name", "playerCount": 0}
var broadcaster : PacketPeerUDP
var listner : PacketPeerUDP
@export var listenPort : int = 300
@export var broadcastPort : int = 3001
@export var broadcastAddress : String = '192.168.68.255'

@export var serverInfo : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	broadcastTimer = $BroadcastTimer
	pass 
	
func setUp():
	listner = PacketPeerUDP.new()
	var ok = listner.bind(listenPort)
	if ok == OK:
		print("Bound to listen Port "  + str(listenPort) +  " Successful!")
		temp=true
	else:
		print("Failed to bind to listen port!")
		temp = false
		


func _process(delta):
	if temp:
		refres_process()

func refres_process():
	if listner.get_available_packet_count() > 0:
		var serverip = listner.get_packet_ip()
		var serverport = listner.get_packet_port()
		var bytes = listner.get_packet()
		var data = bytes.get_string_from_ascii()
		var roomInfo = JSON.parse_string(data)
		
		print("server Ip: " + serverip +" serverPort: "+ str(serverport) + " room info: " + str(roomInfo))
		
		for i in $Panel/VBoxContainer.get_children():
			if i.name == roomInfo.name:
				i.get_node("Adres").text = str(serverip)
				i.get_node("Slots").text = str(roomInfo.playerCount)
				return
		var currentInfo = serverInfo.instantiate()
		currentInfo.name = roomInfo.name
		print(roomInfo.name)
		currentInfo.get_node("Name").text = roomInfo.name
		currentInfo.get_node("Adres").text = serverip
		currentInfo.get_node("Slots").text = str(roomInfo.playerCount)
		$Panel/VBoxContainer.add_child(currentInfo)
		pass
	pass

func setUpBroadCast(name):
	RoomInfo.name = name
	RoomInfo.playerCount = GameControl.Players.size()
	broadcaster = PacketPeerUDP.new()
	broadcaster.set_broadcast_enabled(true)
	broadcaster.set_dest_address(broadcastAddress, listenPort)
	var ok = broadcaster.bind(broadcastPort)
	
	if ok == OK:
		print("Bound to Broadcast Port "  + str(broadcastPort) +  " Successful!")
	else:
		print("Failed to bind to broadcast port!")
		
	$BroadcastTimer.start()

func _on_broadcast_timer_timeout():
	print("Broadcasting Game!")
	RoomInfo.playerCount = GameControl.Players.size()
	var data = JSON.stringify(RoomInfo)
	var packet = data.to_ascii_buffer()
	broadcaster.put_packet(packet)


func cleanUp():
	listner.close()
	$BroadcastTimer.stop()
	if broadcaster != null:
		broadcaster.close()


func _exit_tree():
	cleanUp()



func _on_button_button_down() -> void:
	refres_process()
	
	
func joinbyIp(ip):
	joinGame.emit(ip)
