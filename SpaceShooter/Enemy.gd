"""
Enemy.gd
Extends Area 2D, contains var SPEED, ARMOR, _process().
"""
extends Area2D

# Variable to be used in _process() for movement.
export (int) var SPEED = 20

# Variable to be used... , amount of times it can be hit.
export (int) var ARMOR = 3

"""
func _process()
Controls the movement of the enemy that will move towards the ship.
"""
func _process(delta: float) -> void:
	position.x -= SPEED * delta
