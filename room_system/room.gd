extends Node2D

func _ready():
	for i in get_children():
		if i.is_in_group("pause_on_innactive"):
			i.set_physics_process(false)
			i.set_process(false)
			i.set_process_input(false)
	modulate.a = 0.0

func transfer_to_room(room):
	get_parent().set_room_focus(room)

func get_neighbors():
	var ret_list := []
	for i in $NeighborNodes.get_children():
		ret_list.append(i.name)
	return ret_list

func get_neighbor_pos(neighbor_name):
	return $NeighborNodes.get_node(neighbor_name).global_position

func _position_room(neighbor_name,neighbor_pos):
	if not $NeighborNodes.has_node(neighbor_name):
		print_debug("Neighbor %s does not exist" % neighbor_name)
		return
	var difference : Vector2 = neighbor_pos - $NeighborNodes.get_node(neighbor_name).position
	
	global_position = difference
	print("position set to %s"%global_position)

func _enter_room(transition:bool):
	print("%s is entering"%name)
	visible = true
	if transition:
		enter_transition()
		yield($AnimationPlayer,"animation_finished")
	else:
		modulate = Color.white
	
	for i in get_children():
		if i.is_in_group("pause_on_innactive"):
			i.set_physics_process(true)
			i.set_process(true)
			i.set_process_input(true)
	
	

func _exit_room(transition:bool):
	print("%s is exiting"%name)
	if transition:
		exit_transition()
		yield($AnimationPlayer,"animation_finished")
	print("%s has exited"%name)
	for i in get_children():
		if i.is_in_group("pause_on_innactive"):
			i.set_physics_process(false)
			i.set_process(false)
			i.set_process_input(false)
	visible = false

func enter_transition():
	$AnimationPlayer.play("room_enter")

func exit_transition():
	$AnimationPlayer.play("room_exit")
