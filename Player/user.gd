extends Node
var player_id = 0
var player_name = ""
const SAVE_PATH = "user://player_config.cfg"

func _ready():
	load_player_name()

func load_player_name():
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)

	if err == OK:
		player_name = config.get_value("player", "name", "")
		player_id = config.get_value("player", "id", 0)
	if player_name.is_empty():
		request_player_name()  

func request_player_name():
	var popup = AcceptDialog.new()
	popup.dialog_text = "Podaj swoją nazwę:"
	popup.title  = "New User"
	
	var line_edit = LineEdit.new()
	popup.add_child(line_edit)
	
	popup.ok_button_text = "Zapisz"
	popup.confirmed.connect(func():
		save_player_name(line_edit.text)
		popup.queue_free()
	)
	
	add_child(popup)
	popup.popup_centered()

func save_player_name(name):
	var config = ConfigFile.new()
	config.set_value("player", "name", name)
	config.save(SAVE_PATH)
	player_name = name
	print("Zapisano nazwę gracza:", name)
