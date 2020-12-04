"""
STARTMENU.GD

This is the first screen of the game. It's simply a Start button that when
pressed goes to the world.tscn.
"""
extends Node


"""
func _ON_STARTBUTTON_PRESSED()

When the button is pressed go to the scene World.
"""
func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://World.tscn")
