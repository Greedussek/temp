extends Control

@onready var create_game_button = $CreateGameButton
@onready var join_game_button = $JoinGameButton
@onready var exit_button = $ExitButton

func _ready():
	var start_game = "res://Server/ServerBrowser.tscn"
	create_game_button.pressed.connect(_on_create_game_pressed)
	join_game_button.pressed.connect(_on_join_game_pressed)
	exit_button.pressed.connect(_on_exit_pressed)

func _on_create_game_pressed():
	print("Tworzenie nowej gry...")
	$"../MultiplayeerControler".request_server_name()
	self.hide()


func _on_join_game_pressed():
	print("Dołączanie do gry...")
	$"../MultiplayeerControler".ListGame()#_on_join()
	self.hide()
	 # Załaduj scenę dołączania do gry

func _on_exit_pressed():
	print("Zamykanie gry...")
	get_tree().quit()  # Zamyka aplikację


func _on_server_browser_start_game() -> void:
	$"../MultiplayeerControler".StartGame()
	pass # Replace with function body.
