####            Pause Menu Controls            ####
###################################################
####          Attached on PauseMenu            ####
###################################################
#### "res://Scenes/Menu Scenes/PauseMenu.tscn" ####
###################################################
extends Control



func _ready():
	$Continue.connect("pressed",self,"_continue")
	$Exit.connect("pressed",self,"_exit")




func _exit():
	get_tree().quit()

func _continue():
	get_node("/root/LevelRoot")._togglePause()
	