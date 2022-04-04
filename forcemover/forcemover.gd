class_name Forcemover, "res://modules/forcemover/forcemover.png"
extends Area2D

export (Vector2) var forcemove_dir
export (float) var forcemove_time

func _ready():
	connect("body_entered",self,"_object_entered")

func _object_entered(body):
	if body.has_method("forcemove"):
		body.forcemove(forcemove_dir,forcemove_time)
