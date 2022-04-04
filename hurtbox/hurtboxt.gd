class_name Hurtbox, "res://modules/hurtbox/hurtbox.png"
extends Area2D

export var damage := 0

func do_damage():
	for i in get_overlapping_areas():
		if i.has_method("take_damage"):
			i.take_damage(damage)
