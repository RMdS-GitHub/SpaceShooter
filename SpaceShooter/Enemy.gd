"""
ENEMY.GD

It controls the movement of the enemy and the collisions. When the enemy leaves
the screen the notifier activates and removes the enemy from the main scene.
When enemy is removed from the world scene it plays the animation explosion.
If the enemy is killed by the player 10 points will be add thanks to
func _ready().

We comment the signal and the connect and just update the score directly on
world.gd with setget set_score.
"""
extends Area2D


# Variable to be used in _process() for movement.
export (int) var SPEED = 20

# Variable to be used... , amount of times it can be hit.
export (int) var ARMOR = 3

# Variable to get the explosion animation. 
const EXPLOSIONEFFECT = preload("res://ExplosionEffect.tscn")

# Signal for adding score when enemy killed. Only add if enemy is killed not
# when it leaves the screen.
# signal score_up


"""
FUNC _READY()

Gets access to the main scene, world.
Connects the signal score_up to the main scene, create _on_Enemy_score_up()
only if we are in the main node if this one is a world node.

On node world, on groups add the World group. The function _on_Enemy_score_up 
should be added to the world.gd. If it is confirmed that the scene is the
world, connect will be true and func _on_Enemy_score_up will play up on
world.gd.

We comment the signal and the connect and just update the score directly on
world.gd with setget set_score.
"""
#func _ready() -> void:
#	var main = get_tree().current_scene
#	if main.is_in_group("World"):
#		# connect("score_up", main, "_on_Enemy_score_up")
#		main.score += 10


"""
FUNC _PROCESS

Controls the movement of the enemy that will move towards the ship.
"""
func _process(delta: float) -> void:
	position.x -= SPEED * delta


"""
FUNC _ON_ENEMY_BODY_ENTERED()

Signal. When the bullet, the body, collides with the enemy this one loses 1 
armor and the bullet is destroyed. If the enemy loses 3 points it is also 
destroyed. Emit signal score_up if killed.

We comment the signal and the connect and just update the score directly on
world.gd with setget set_score.

When the laser enters in collision it plays the hit sound.
"""
func _on_Enemy_body_entered(body: Node) -> void:
	body.create_hit_effect()
	body.queue_free()
	ARMOR -= 1
	if ARMOR <= 0:
		# emit_signal("score_up")
		add_to_score()
		_create_explosion()
		queue_free()


"""
FUNC _ON_VISIBILITYNOTIFIER2D_SCREEN_EXITED()

Signal. When the enemy exits the screen it is removed.
"""
func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


"""
FUNC _CREATE_EXPLOSION()

When the enemy is about to leave the scene. Get the name of the current scene,
world.tscn, var = the explosion animation, add the explosion as a child to the
main scene, the position of the explosion is the same of the enemy.
"""
func _create_explosion() -> void:
	var main = get_tree().current_scene
	var explosionEffect = EXPLOSIONEFFECT.instance()
	main.add_child(explosionEffect)
	explosionEffect.global_position = global_position
	
	
"""
FUNC ADD_TO_SCORE()

Function to add the score.
"""
func add_to_score():
	var main = get_tree().current_scene
	if main.is_in_group("World"):
	# connect("score_up", main, "_on_Enemy_score_up")
		main.score += 10
