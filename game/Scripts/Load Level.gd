extends Spatial


export (PackedScene) onready var Level



func _ready():
	$Play.connect("pressed", self,"_playGame")
	$Exit.connect("pressed", self,"_exitGame")
	$"Change Music".connect("pressed", self, "_changeMusic")
	
	pass 


func _changeMusic():
	$"/root/MusicManager"._changeSong()
	pass

func _playGame():
	get_tree().change_scene_to(Level)
	
func _exitGame():
	get_tree().quit()
	