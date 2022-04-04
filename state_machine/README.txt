State Machine
Annabelle Lewis - 2021

# Description
	Basic state machine system

# Dependencies
	None

# Implimentation
	To give a node state behaviour, add a StateMachine node as a child of this object, and add the State nodes as the children of this StateMachine

	StateMachine
		Before the StateMachine can be used, you need to call the "set_host" function with the host node as the only argument, the states will directly access this node

		Every update/physics update call the _tick(delta) method, this will update the current state

		To change the current state call the set_state(state) function with the name of the state node as the argunment

	State
		States have 3 functions that can be overrided
		_enter_state(host,state_machine:StateMachine):
		_tick_state(delta:float,host,state_machine:StateMachine):
		_exit_state(host,state_machine:StateMachine):
		The host in all these functions will be the host node as specified in the StateMachine, and the state_machine will be the StateMachine node
