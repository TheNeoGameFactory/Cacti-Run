extends Node



var highscore = 0 setget _setHighscore
var filePath = "user://Highscore.data"

func _ready():
	_loadHighscore()
	pass
	
	
func _loadHighscore():
	var file = File.new()
	if not file.file_exists(filePath):
		return
		
	file.open(filePath, File.READ)
	highscore = file.get_var()
	file.close()
	
	
	
func _saveHighscore():
	var file = File.new()
	file.open(filePath, File.WRITE)
	file.store_var(highscore)
	file.close()
	
	
func _setHighscore(newValue):
	highscore = newValue
	_saveHighscore()