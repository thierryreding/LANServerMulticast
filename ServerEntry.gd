@tool
class_name ServerEntry extends HBoxContainer

@export var description : String = "Hello, World!" :
	set = _set_description

@export var address : String = "127.0.0.1" :
	set = _set_address

@export var port : int = 7482 :
	set = _set_port

func _set_description(value):
	$LabelDescription.text = value
	description = value

func _set_address(value):
	$LabelAddress.text = value
	address = value

func _set_port(value):
	$LabelPort.text = "%d" % value
	port = value
