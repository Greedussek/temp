extends Node2D

@export var CardColor= 0
@export var Team = 0
@export var DownTeam = 0
@onready var Wote = $Sprite2D/Area2D
@onready var Selected =$Sprite2D2/Area2D
func _ready():
	Wote.connect("wote", _on_wote)
	Selected.connect("selected", _on_selected)
func _Label_name(Labelname,team):
	$Label.text=Labelname
	Team=team
func _on_wote():
	print ("wote")
	pass
func _on_selected():
	print ("selected"+ str(Team))
	pass
