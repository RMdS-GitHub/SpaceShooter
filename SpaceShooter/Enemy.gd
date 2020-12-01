"""
Enemy.gd

Extends Area 2D, contains var SPEED, ARMOR, _process(), 
func _on_Enemy_body_entered(), func _on_VisibilityNotifier2D_screen_exited().

It controls the movement of the enemy and the collisions. When the enemy leaves
the screen the notifier activates and removes the enemy from the main scene.
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


"""
func _on_Enemy_body_entered()

Signal. When the bullet, the body, collides with the enemy this one loses 1 
armor and the bullet is destroyed. If the enemy loses 3 points it is also 
destroyed.
"""
func _on_Enemy_body_entered(body: Node) -> void:
	body.queue_free()
	ARMOR -= 1
	if ARMOR <= 0:
		queue_free()


"""
func _on_VisibilityNotifier2D_screen_exited()

Signal. When the enemy exits the screen it is removed.
"""
func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
