extends Spatial


export (PackedScene) var Level



func _ready():
	$Play.connect("pressed", self,"_playGame")
	pass 



func _playGame():
	get_tree().change_scene_to(Level)
	