extends Node2D

@export var Team = 0
var ischeck = false
var shared_array = null  # Referencja do tablicy
var index = -1  # Indeks w tablicy

@onready var Wote = $Sprite2D/Area2D
@onready var Selected = $Sprite2D2/Area2D

func _ready():
	Wote.connect("input_event", _on_wote)
	Selected.connect("input_event", _on_selected)

func init_data(label_name, team, array_ref, array_index):
	$Label.text = label_name
	Team = team
	shared_array = array_ref  # Pobieramy referencję do tablicy
	index = array_index
	ischeck = shared_array[index]  # Pobieramy wartość

func _on_wote(_viewport, _event, _shape_idx):
	print("wote")

func _on_selected(_viewport, _event, _shape_idx):
	print("selected " + str(Team))
	toggle_value()

func toggle_value():
	if shared_array and index >= 0:
		shared_array[index] = !shared_array[index]  # Odwracamy wartość
		ischeck = shared_array[index]  # Aktualizujemy lokalnie
		print("Nowa wartość dla index", index, ":", ischeck)
