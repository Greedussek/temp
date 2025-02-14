extends Control

const BROADCAST_PORT = 9999
var udp_peer = PacketPeerUDP.new()
var server_list = {}

@onready var server_container = $Container  # Kontener na listę serwerów
@onready var refresh_button =  $Button  # Przycisk odświeżania

func _ready():
	# Przypisujemy port do nasłuchiwania
	var result = udp_peer.bind(BROADCAST_PORT)
	if result != OK:
		print("Błąd: Nie udało się uruchomić serwera UDP!")
		return
	
	refresh_button.pressed.connect(search_for_servers)
	set_process(true)
	var back_button = Button.new()
	back_button.text = "Cofnij"
	back_button.pressed.connect(_on_back_pressed)
	add_child(back_button)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://UI/start.tscn")

func _process(delta):
	if udp_peer.get_available_packet_count() > 0:
		var packet = udp_peer.get_packet()  # Odbieramy pakiet
		var server_name = packet.get_string_from_utf8()  # Zakładając, że pakiet to tekst
		var server_ip = udp_peer.get_packet_ip()  # Pobieramy IP pakietu

		if server_ip not in server_list:
			server_list[server_ip] = server_name
			add_server_button(server_ip, server_name)

func add_server_button(ip, name):
	var button = Button.new()
	button.text = name + " (" + ip + ")"
	button.pressed.connect(func(): connect_to_server(ip))
	server_container.add_child(button)

func connect_to_server(ip):
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(ip, 9999)
	multiplayer.multiplayer_peer = peer
	print("Łączę się z serwerem:", ip)

func search_for_servers():
	print("Odświeżam listę serwerów...")
	server_list.clear()
	for child in server_container.get_children():
		child.queue_free()  # Usuwamy stare przyciski
