extends Control

@onready var create_game_button = $CreateGameButton
@onready var join_game_button = $JoinGameButton
@onready var exit_button = $ExitButton

func _ready():
	create_game_button.pressed.connect(_on_create_game_pressed)
	join_game_button.pressed.connect(_on_join_game_pressed)
	exit_button.pressed.connect(_on_exit_pressed)

func _on_create_game_pressed():
	print("Tworzenie nowej gry...")
	$"../Serwer Name".request_server_name()


func _on_join_game_pressed():
	print("Dołączanie do gry...")
	get_tree().change_scene_to_file("res://server_list.tscn")  # Załaduj scenę dołączania do gry

func _on_exit_pressed():
	print("Zamykanie gry...")
	get_tree().quit()  # Zamyka aplikację
