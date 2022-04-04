class_name RoomSmoothDoor, "res://modules/room_smooth_doors/room_smooth_door.png"
extends Forcemover

export (String) var room_target

func _ready():
	connect("body_entered",self,"body_entered")

func body_entered(body):
#	print_debug("%s begining level change to %s"%[get_parent().name, room_target])
	get_parent().transfer_to_room(room_target)
