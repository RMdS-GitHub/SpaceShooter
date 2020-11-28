"""
Ship.gd
Extends Area2D, contains, var SPEED, _process(). 
This controls the ship movement, which goes up and down.

"""
extends Area2D

# Variable to be used in _process() for movement.
export(int) var SPEED = 100


"""
func _process()
Receives input from player, move ship up and down.
""" 
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
