extends Control
@export var PlayerScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	GameControl.addPlayer()
	var index = 0
	
	for i in GameControl.Players:
		var currentPlayer = PlayerScene.instantiate()
		currentPlayer.game_status = str(GameControl.Players[i].game_status)
		currentPlayer.game_id= str(GameControl.Players[i].game_id)
		currentPlayer.user_nick = str(GameControl.Players[i].name)
		add_child(currentPlayer)
		
	pass # Replace with function body.
