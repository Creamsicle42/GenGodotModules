class_name BulletSystem
extends Node2D

export (int) var max_bullet_count := 1000

var active_bullets := []
var inactive_bullets := []

var gametime := 0.0

func _ready():
	for i in max_bullet_count:
		var bullet = Bullet.new()
		add_child(bullet)
		inactive_bullets.append(bullet)

func _process(delta):
	gametime += delta

func fire_bullet(props):
	if inactive_bullets.size() < 1:
		# print_debug("Tried to spawn bullet but there were none left")
		return
	var bullet = inactive_bullets[0]
	bullet._fire(props)
	inactive_bullets.erase(bullet)
	active_bullets.append(bullet)

func bullet_deactivate(bullet):
	active_bullets.erase(bullet)
	inactive_bullets.append(bullet)
