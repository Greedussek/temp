extends Area2D
signal selected
@onready var sprite = $".."
var Teks = load("res://Thumb-Up-Hover.png")
var Teks2 = load("res://Thumb-Up-Idle.png")
func _ready():
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)

func _on_mouse_entered():
	sprite.texture = Teks  

func _on_mouse_exited():
	sprite.texture = Teks2  
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("selected")

func _process(delta: float) -> void:
	pass
