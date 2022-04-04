class_name RoomMaster
extends Node2D

const ROOM_PATH_FORM := "res://assets/rooms/%s.tscn"

var instnaced_neighbors = []

var current_room

func load_room(path):
	
	for i in get_children():
		i.queue_free()

	var room = load(ROOM_PATH_FORM % path).instance()
	
	add_child(room)
	current_room = room
	room._enter_room(true)
	var neighbors = room.get_neighbors()
	load_room_neighbors(neighbors)

func set_room_focus(room):
	assert(has_node(room))
	current_room._exit_room(true)
	current_room = get_node(room)
	current_room._enter_room(true)
	load_room_neighbors(current_room.get_neighbors())

func load_room_neighbors(needed_neighbors:Array):
	print(needed_neighbors)
	for i in get_children():
		if not (i == current_room or needed_neighbors.has(i.name)):
			print("removing %s" % i.name) 
			i.queue_free()
		else:
			needed_neighbors.erase(i.name)
	for i in needed_neighbors:
		add_neighbor(i)

func add_neighbor(id):
	var room = load(ROOM_PATH_FORM % id).instance()
	add_child(room)
	room.set_process(false)
	room.visible = false
	room._position_room(current_room.name,current_room.get_neighbor_pos(id))
