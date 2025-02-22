extends HBoxContainer
signal joinGame(ip)

func _on_button_button_down() -> void:
	joinGame.emit($Adres.text)
	pass # Replace with function body.
