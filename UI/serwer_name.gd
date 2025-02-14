extends Node

func request_server_name():
	var popup = AcceptDialog.new()
	popup.dialog_text = "Podaj swoją Servera:"
	popup.title  = "Crate Server"
	var line_edit = LineEdit.new()
	popup.add_child(line_edit)
	popup.ok_button_text = "Zapisz"
	popup.confirmed.connect(func():
		$"../Server".SERVER_NAME=line_edit.text
		$"../Server".start_server()
		popup.queue_free()
	)
	
	add_child(popup)
	popup.popup_centered()
