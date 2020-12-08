"""
STARTMENU.GD

This is the first screen of the game. It's simply a Start button that when
pressed goes to the world.tscn.
Update, we remove the button since it's mouse controlled and put
input for start an leave the game.
"""
extends Node


"""
FUNC _PROCRESS()

When input is ui_accept, start the game, when its ui_cancel, leave the game.
"""
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		#Var to remove warning in debugger. Undescore not doing anything.
		var _r = get_tree().change_scene("res://World.tscn")
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


"""
FUNC _ON_STARTBUTTON_PRESSED()

When the button is pressed go to the scene World.
"""
# func _on_StartButton_pressed() -> void:
#	get_tree().change_scene("res://World.tscn")
