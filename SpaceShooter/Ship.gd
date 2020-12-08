"""
SHIP.GD

This controls the ship movement, which goes up and down.
Fires the laser.
Destroys the ship and the enemy if they collide with each other.
Play they explosing animation when leaving the tree scene.
When the player dies go to gameover scene thanks to signal playerDeath.
"""
extends Area2D

# Variable to get the explosion animation. 
const EXPLOSIONEFFECT = preload("res://ExplosionEffect.tscn")

# This const gives access to bullet.tscn.
const LASER = preload("res://Laser.tscn")

# Variable to be used in _process() for movement.
export(int) var SPEED = 100

# Signal for when player dies.
signal playerDeath


"""
FUNC _PROCESS()

Receives input from player, move ship up and down holding the key.
Fires the bullets just pressing the key.
For testing purposes in comment input to destroy the ship. 
""" 
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_just_pressed("ui_accept"):
		fire_laser()
	#if Input.is_action_just_pressed("ui_cancel"):
	#	queue_free()


"""
FUNC _FIRE_LASER()

Gets the bullet.tsnc with var bullet, gets the World node (root) with main.
With these two var declared it adds the bullet as child in the World node. 
Sets the bullet position to the position of the ship.
"""
func fire_laser():
	var laser = LASER.instance()
	var main = get_tree().current_scene
	main.add_child(laser)
	laser.global_position = global_position


"""
FUNC _ON_SHIP_AREA_ENTERED()

Signal. When a Area2D collides with the ship.
It destroys the foreign Areas2D and also the ship.
"""
func _on_Ship_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
	
	
"""
FUNC _EXIT_TREE()

When the ship is about to leave the scene. Get the name of the current scene,
world.tscn, var = the explosion animation, add the explosion as a child to the
main scene, the position of the explosion is the same of the ship.
When player player dies, emit signal playerDeath.
"""
func _exit_tree() -> void:
	var main = get_tree().current_scene
	var explosionEffect = EXPLOSIONEFFECT.instance()
	main.call_deferred("add_child", explosionEffect)
	explosionEffect.global_position = global_position
	emit_signal("playerDeath")
