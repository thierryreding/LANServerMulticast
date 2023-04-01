@tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("ServerAdvertiser", "Node", load("res://addons/LANServerMulticast/ServerAdvertiser.gd"), null)

func _exit_tree():
	remove_custom_type("ServerAdvertiser")
