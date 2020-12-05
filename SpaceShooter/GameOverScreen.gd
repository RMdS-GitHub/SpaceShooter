"""
GAMEOVERSCREEN.GD

This is the gameover screen of the game. It as the option to return to the 
main menu.
"""
extends Node


"""
FUNC _PROCESS()

When input is ui_accept, go the StartMenu scene.
"""
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://StartMenu.tscn")

