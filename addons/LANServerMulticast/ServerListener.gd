class_name ServerListener extends Node

signal server_found(name : String, ip : String, port : int)

@export var address := "224.0.0.3"
@export var port := 7482

var socket : PacketPeerUDP
var interfaces : Array[String]

func _enter_tree():
	socket = PacketPeerUDP.new()
	socket.bind(port)

	for iface in IP.get_local_interfaces():
		socket.join_multicast_group(address, iface["name"])
		interfaces.append(iface["name"])

func _exit_tree():
	if socket != null:
		socket.close()

func _process(_delta):
	if socket.get_available_packet_count() > 0:
		var packet = socket.get_packet()
		var data = packet.get_string_from_utf8()
		var info = JSON.parse_string(data)
		
		emit_signal("server_found", info["description"], info["address"], info["port"])
