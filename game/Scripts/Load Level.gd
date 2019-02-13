extends Spatial


export (PackedScene) var Level



func _ready():
	$Play.connect("pressed", self,"_playGame")
	$Exit.connect("pressed", self,"_exitGame")
	pass 



func _playGame():
	get_tree().change_scene_to(Level)
	
func _exitGame():
	get_tree().quit()
	