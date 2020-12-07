"""
GAMEOVERSCREEN.GD

This is the gameover screen of the game. It as the option to return to the 
main menu. Shows the highscore.
"""
extends Node

# On ready get the highscore label.
onready var highscoreLabel : Label = $HighScoreLabel

"""
FUNC _READY()

"""
func _ready():
	set_highscore_label()


"""
FUNC SET_HIGHSCORE_LABEL()

Load the save data, get the highscore from it, set that to the highscore label.
"""
func set_highscore_label():
	var save_data = SaveAndLoad.load_data_from_file()
	highscoreLabel.text = "Highscore: " + str(save_data.highscore)
	

"""
FUNC _PROCESS()

When input is ui_accept, go the StartMenu scene.
"""
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://StartMenu.tscn")

