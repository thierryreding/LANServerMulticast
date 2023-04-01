@tool
extends Control

@onready var server_list := $HBoxContainer/ServerList
@onready var listener := $ServerListener

var ServerEntryClass := preload("res://ServerEntry.tscn")

func _ready():
	for child in server_list.get_children():
		server_list.remove_child(child)
	
	listener.server_found.connect(_on_server_listener_server_found)

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")

func _on_server_listener_server_found(description, address, port):
	for child in server_list.get_children():
		var entry := child as ServerEntry
		
		if entry.address == address and entry.port == port:
			return
	
	# if no entry exists for the new server, create a new one
	var entry := ServerEntryClass.instantiate()
	entry.description = description
	entry.address = address
	entry.port = port
	server_list.add_child(entry)
