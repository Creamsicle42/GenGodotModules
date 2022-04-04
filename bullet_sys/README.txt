Bullet System
Annabelle Lewis - 2021

# Description
	Provides a low overhead sollution to spawning a large number of bullets

# Dependencies
	None

# Implimentation
	To use this system add a BulletSystem node to the scene, all bullets will be children of this node so give it a corresponding z-sort.  This node will have a "max_bullet_count" export variable, this is the maximum number of bullets that can be active at one time.  This cannot be adjusted at runtime due to the object pooling implimentation so make sure to set it accordingly.

	To spawn a bullet call the fire_bullet function with a properties dctionary 

	The possible fields for the properties dictionary are as follows, properties marked with a * are optional

	position,Vector2 : The global position of the bullet at it's start
	rotation,float : The global rotation of the bullet at it's start
	sprites, [Stream texture]: An array containing the texture(s) for the bullet, animated bullets will have each frame be it's own textures
	damage, int: The damage value of the bullet
	speed, float: The speed of the bullet in units/sec
	radius, float: The detection radius (at the moment bullets use raycasts for collision, so this determines the length of the ray)
	*lifetime, float: The time (in seconds) that the bullet will be active, if not specified the bullet will be active till it hits something
	*frame_time, float: The time (in seconds) of each animation frame if there are multiple sprites given
	*collision_mask, int: The collision mask of the bullet, w=by default bullets will only interract with layer 1
	