extends Control



func _ready():
	$Restart.connect("pressed", self, "_restartLevel")
	$Exit.connect("pressed", self, "_exit")



func _restartLevel():
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass
	
	
func _exit():
	get_tree().quit()