extends Node
const SAVE_PATH = "user://player_config.cfg" 
var Players = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_player_name():
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)  # Próba wczytania pliku

	if err == OK:  # Jeśli udało się załadować
		var player_name = config.get_value("player", "name", "Unknown")  
		return player_name
	else:
		print("Brak zapisanej nazwy gracza, ustawiono domyślną.")
		return "Unknown"
		
func load_player_id():
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)  # Próba wczytania pliku

	if err == OK:  # Jeśli udało się załadować
		var player_name = config.get_value("player", "id", 0)  
		return player_name
	else:
		print("Brak zapisanej nazwy gracza, ustawiono domyślną.")
		return "Unknown"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
