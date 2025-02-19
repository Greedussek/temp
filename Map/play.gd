extends Node
@export var Many = 8
@export var Team=[3] 



func _on_ready() -> void:
	for i in range(24):
		if i<8:
			Team.append(1)
		elif i<17:
			Team.append(2)
		else :
			Team.append(0)

func losuj_card():
	Team.shuffle()  
	return Team
