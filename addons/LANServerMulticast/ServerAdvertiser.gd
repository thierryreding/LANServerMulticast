class_name ServerAdvertiser extends Node

@export var address := "224.0.0.3"
@export var port := 7482
@export var interval := 5.0

var socket : PacketPeerUDP
var timer := Timer.new()
var info := Dictionary()

func _enter_tree():
	info["description"] = "Hello, World!"
	info["address"] = "127.0.0.1"
	info["port"] = 7482
	
	socket = PacketPeerUDP.new()
	socket.set_dest_address(address, port)
	advertise()
	
	timer.timeout.connect(advertise)
	timer.wait_time = interval
	timer.autostart = true
	add_child(timer)

func advertise():
	var data := JSON.stringify(info)
	var packet := data.to_utf8_buffer()
	socket.put_packet(packet)

func _exit_tree():
	timer.stop()
	
	if socket != null:
		socket.close()
