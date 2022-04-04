class_name StateMachine, "res://modules/state_machine/state_machine_icon.png"
extends Node

var host

var current_state : String = ""

func _ready():
	validate_states()

func _tick(delta):
	if current_state != "":
		pass
	get_node(current_state)._tick_state(delta,host,self)

func set_state(new_state:String):
	if current_state != "":
		get_node(current_state)._exit_state(host,self)
	current_state = new_state
	get_node(current_state)._enter_state(host,self)

func set_host(host):
	self.host = host
