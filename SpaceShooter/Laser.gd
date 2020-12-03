"""
LASER.GD

It's just an effect audio/visual when triggering the laser.
On Inspector turn off autoplay for LaserSound, we will play sound with code.
When _ready() play the laser sound, play the effect when leaving the tree scene.
"""
extends RigidBody2D

# Get the HitEffect scene.
const HITEFFECT = preload("res://HitEffect.tscn")

# Var to get the laser sound.
onready var laserSound: AudioStreamPlayer = $LaserSound


"""
FUNC _READY()

When ready play the laser sound.
"""
func _ready():
	laserSound.play()
	
	
"""
FUNC _EXIT_TREE()

When the object leaves the scene tree, play the effect.
Now there is a bug since the sound is playing outside the visual scene.
We are removing this function.
"""
#func _exit_tree() -> void:
#	create_hit_effect()
	

"""
FUNC CREATE_HIT_EFFECT()

Get the current scene. In this case World.tscn.
Create a variable with Hiteffect.tscn, add a child of it in current scene.
Position of hitEffect is the same of laser.
"""
func create_hit_effect():
	var main = get_tree().current_scene
	var hitEffect = HITEFFECT.instance()
	main.add_child(hitEffect)
	hitEffect.global_position = global_position
