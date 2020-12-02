"""
Ship.gd

Extends Area2D, contains, var SPEED, const EXPLOSIONEFFECT const BULLET, 
_process(), fire_bullet(), func _on_Ship_area_entered(), func _exit_tree().

This controls the ship movement, which goes up and down.
"""
extends Area2D

# Variable to get the explosion animation. 
const EXPLOSIONEFFECT = preload("res://ExplosionEffect.tscn")

# This const gives access to bullet.tscn.
const BULLET = preload("res://Bullet.tscn")

# Variable to be used in _process() for movement.
export(int) var SPEED = 100


"""
func _process()

Receives input from player, move ship up and down holding the key.
Fires the bullets just pressing the key. 
""" 
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_just_pressed("ui_accept"):
		fire_bullet()


"""
func fire_bullet()

Gets the bullet.tsnc with var bullet, gets the World node (root) with main.

With these two var declared it adds the bullet as child in the World node. 

Sets the bullet position to the position of the ship.
"""
func fire_bullet():
	var bullet = BULLET.instance()
	var main = get_tree().current_scene
	main.add_child(bullet)
	bullet.global_position = global_position


"""
func _on_Ship_area_entered()

Signal. When a Area2D collides with the ship.
It destroys the foreign Areas2D and also the ship.
"""
func _on_Ship_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
	
	
"""
func _exit_tree()

When the enemy is about to leave the scene. Get the name of the current scene,
world.tscn, var = the explosion animation, add the explosion as a child to the
main scene, the position of the explosion is the same of the enemy.
"""
func _exit_tree() -> void:
	var main = get_tree().current_scene
	var explosionEffect = EXPLOSIONEFFECT.instance()
	main.add_child(explosionEffect)
	explosionEffect.global_position = global_position
