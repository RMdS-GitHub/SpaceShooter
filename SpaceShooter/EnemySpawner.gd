"""
ENEMYSPAWNER.GD

The EnemySpawner2D node is attached to the World scene. Once we play the game
the timer attached to EnemySpawner reaches its end after 2 seconds and 
re-initilizes each time.
The timer calls the spawn_enemy(), the first thing that this function does, 
it calls the get_spawn_position() wich gives us a random position2d child of the
SpawnPoints node2d.
Then it calls an enemy from the Enemy.tscn.
Gets the current scene, in this case World and adds a chid enemy at the position
of the random position2D returned from get_spawn_position().
We put Enemy Spawner 2D at the far right of the World scene.
"""
extends Node2D

# Const var preloads Enemy.tscn. Used in spawn_enemy().
const ENEMY = preload("res://Enemy.tscn")

# Onready var, gets the Spawn points node containing all points.
# Used in get_spawn_position().
onready var spawnPoints : Node2D = $SpawnPoints


"""
FUNC _ON_TIMER_TIMEOUT()

Signal on timer. 
When timer runs out runs the code.
On the Inspector timer, wait time is set to 2 seconds, autostart on.
"""
func _on_Timer_timeout() -> void:
	spawn_enemy()
	
	
"""
FUNC SPAWN_ENEMY()

Var spawn_position gets a random position2D from SpawnPoints thanks to 
get_spawn_position().
Var enemy gets an enemy object thanks to the const var ENEMY which points the
direction to it.
Var main gets the current scene which where EnemySpawner is, in this case the
World scene.
On the world scene it add an enemy object at a random position given by 
get_spawn_position().
"""
func spawn_enemy():
	var spawn_position = get_spawn_position()
	var enemy = ENEMY.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = spawn_position


"""
FUNC GET_SPAWN_POINT()

Get a spawn point from the list of SpawnPoints.
The var points is an array with all the Position2d. The function shuffle() 
picks the array and shuffles all Position2d. 
We will not know which one we return at the first position of the array since 
they've been shuffled.
"""
func get_spawn_position():
	var points = spawnPoints.get_children()
	points.shuffle()
	return points[0].global_position

