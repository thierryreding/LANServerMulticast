extends Control

func _on_host_button_pressed():
	get_tree().change_scene_to_file("res://HostGame.tscn")

func _on_join_button_pressed():
	get_tree().change_scene_to_file("res://JoinGame.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
