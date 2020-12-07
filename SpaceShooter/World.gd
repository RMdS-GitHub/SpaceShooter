"""
WORLD.GD

When an enemy is killed a signal is called on enemy.gd, and func 
_on_Enemy_score_up() will add 10 points to the score. 
Update the text on the label for the score.
We comment the signal and the connect and just update the score directly on
world.gd with setget set_score on Enemy.gd. No need for 
function _on_Enemy_score_up(). ALL WE NEED IS THE SETGET.
When player dies receive a signal from ship.gd so that the game go to the
gameover scene.
Thanks to the singleton SaveAndLoad it also saves and loads the highscore.
"""
extends Node

# Var to keep the score.
var score = 0 setget set_score

# Var to get the label on the World.tscn to update the score.
onready var scoreLabel : Label = $ScoreLabel


"""
FUNC _SET_SCORE()

Created with var score = 0 setget set_score.
In the case that the score is changed by something else than killing an enemy.
We could call this on enemy.gd or player.gd.
Once the score is set somewhere and arrives here, the score is updated within
the label, thanks to update_score_label().
"""
func set_score(value):
	score = value
	update_score_label()


"""
FUNC UPDATE_SCORE_LABEL()

Update the score in the label text.
"""
func update_score_label():
	scoreLabel.text = "Score = " + str(score)


"""
FUNC UPDATE_SAVE_DATA()

Access to node / singleton SaveAndLoad, call the function and save the data 
into the variable.
If the current score is higher than the highscore, highscore = score.
Save that back to the file.
This function is called when the player dies just before changing scenes.
"""
func update_save_data():
	var save_data = SaveAndLoad.load_data_from_file()
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_to_file(save_data)


"""
FUNC _ON_SHIP_PLAYERDEATH()

Signal from ship.gd, wait until signal timeout is received from timer just
created. After that, one second go to gameover scene. We wait so that the 
particle explosion plays before going to the gameover scene.
Before changing scenes update_save_data to store or not the highscore.
"""
func _on_Ship_playerDeath() -> void:
	update_save_data()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://GameOverScreen.tscn")
	
	
"""
FUNC _ON_ENEMY_SCORE_UP()

Function from the connect() from func _ready at enemy.gd. 
This calls the signal score_up arrives into here if it is confirmed that the
scene is World.tscn, play this function and add the points.
When we call this function arrive at score it will actually play the function
set_score(). In order to activate the setter in the same script we need to call
the variable with self.
"""
#func _on_Enemy_score_up():
#	self.score += 10
