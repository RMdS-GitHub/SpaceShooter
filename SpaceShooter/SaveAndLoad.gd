"""
SAVEANDLOAD.GD

It is also a singleton. This script is used to save and load the highscore.
Used in the world.gd  and gameOverScreen.gd script.
The save_data.JSON file can be found in the project folder not sure if project 
is exported.
For testing purposes the save data path: res://save_data.json but for real 
deployments user://save_data.json path.
"""
extends Node

# 
const SAVE_DATA_PATH = "res://save_data.json"

# Dictionnary of key and  value
var defaultSaveData = {
	highscore = 0
}


"""
FUNC SAVE_DATE_TO_FILE()

Takes the save data and converts it to a jason string. Creates a new file,
open it to write on it, save the string, close the file.
"""
func save_data_to_file(save_data):
	var json_string = to_json(save_data)
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_string)
	save_file.close()
	

"""
FUNC LOAD_DATA_FROM_FILE()

Create a new file. If the file does not exists return the default highscore
which is 0.
If we do have a save file open it for reading, convert the file from a json
(parse_json) to a variable / dictionary. Close the file, return the data.
"""
func load_data_from_file():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return defaultSaveData
		
	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text())
	save_file.close()
	return save_data
