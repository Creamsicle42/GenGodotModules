class_name Bullet
extends Sprite

var damage : int 
var speed : float
var radius : float
onready var space_state = get_world_2d().direct_space_state

var textures := []
var frame_time := 0.1
var loop_textures := false
var animtime_offset := 0.0

var lifetime := -1.0

var collision_mask := 1

func _ready():
	set_physics_process(false)
	visible = false
	animtime_offset = rand_range(0.0,10.0)

func _fire(props:Dictionary):
	
	textures = props.sprites
	global_position = props.position
	global_rotation = props.rotation
	damage = props.damage
	speed = props.speed
	radius = props.radius
	
	if props.has("lifetime"):
		lifetime = props.lifetime
	else:
		lifetime = -1.0
	
	if props.has("frame_time"):
		frame_time = props.frame_time
	else:
		frame_time = 1.0
	
	if props.has("collision_mask"):
		collision_mask = props.collision_mask 
	else: 
		collision_mask = 1 
	
	set_physics_process(true)
	visible = true

func _physics_process(delta):
	
	texture = textures[int((Time.game_time+animtime_offset)/frame_time) % textures.size()]
	
	if lifetime != -1.0:
		lifetime -= delta
		if lifetime < 0.0:
			on_hit(self)
	
	var movement = Vector2.RIGHT.rotated(rotation) * speed * delta
	
	# use global coordinates, not local to node
	var result = space_state.intersect_ray(
		global_position,
		global_position + movement + movement.normalized() * radius,
		[],
		collision_mask
	)
	if result:
		on_hit(result.collider)
	global_position += movement

func on_hit(object):
	visible = false
	if object.has_method("take_damage"):
		object.take_damage(damage)
	get_parent().bullet_deactivate(self)
	set_physics_process(false)
