extends Spatial

var pauseMenu

func _ready():
	pauseMenu = GLOBAL.pauseMenu.instance()
	add_child(pauseMenu)
	pauseMenu.hide()
	pass 


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		pauseMenu.show()
		get_tree().paused=true;