Room System
Annabelle Lewis - 2021

# Descryprion
	Handles smooth transitions and resource loading for multiple room scenes

# Dependencies
	None

# Implimentation
	Room creation:
		Room nodes derive from the room class, their top level node must have the same name as the file name. The room node must have two children, a Node2D names "NeighborNodes" and a AnimationPlayer with two animations named "room_enter" and "room_exit". The room scene must be stored in the path "res://assets/rooms/room_name.tcsn"
	Room system:
		The room system acts as the master for all room objects, and it should be a top level scene.  There are two methods for loading into rooms.  The "load_room(room_name)" will clear all loaded rooms and load in the room specified, it should be used for starting the game or teleporting across the map.  The "set_room_focus(room_name)" function causes focus to transfer to the specified room, but this room must be one of the loaded neighbors of the current room.