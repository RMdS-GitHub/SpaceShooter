"""
WORLD.GD

When an enemy is killed a signal is called on enemy.gd, and func 
_on_Enemy_score_up() will add 10 points to the score. 
Update the text on the label for the score.

We comment the signal and the connect and just update the score directly on
world.gd with setget set_score on Enemy.gd. No need for 
function _on_Enemy_score_up(). ALL WE NEED IS THE SETGET.
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
the label.
"""
func set_score(value):
	score = value
	scoreLabel.text = "Score = " + str(score)


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
	
