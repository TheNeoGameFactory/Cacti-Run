extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Continue.connect("pressed",self,"_continue")
	$Exit.connect("pressed",self,"_exit")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _exit():
	get_tree().quit()

func _continue():
	self.hide()
	get_tree().paused=false
	