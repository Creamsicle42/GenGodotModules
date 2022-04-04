class_name Hitbox
extends Area2D

signal take_damage (damage)
export var enabled := true

func take_damage(damage):
	if not enabled: return
	emit_signal("take_damage",damage)
