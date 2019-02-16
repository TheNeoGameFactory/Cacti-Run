####         This is our Level Node         ####
#### We get our Pause Menu from our GLOBALS ####
####    Save it in a variabe to access it   ####
####       Then we can show and hide it     ####
################################################


extends Spatial

var pauseMenu
var togglePauseMenu=false

func _ready():
	pauseMenu = GLOBAL.pauseMenu.instance() # Get Pausemenu from GLOBALS and instantiate it to our variable
	add_child(pauseMenu)                    # Add the Pausemenu as a child to our Root Node, the Level Node
	pauseMenu.hide()                        # We won't start our Game with showing up our Pausemenu
	pass 


func _process(delta):

	# Show or Hide our Pausemenu with the Escape Key - Mapped in InputManager
	if $PlayMenu/Restart_Pivot.visible == false:
		if Input.is_action_just_pressed("Escape"):
			togglePauseMenu = !togglePauseMenu
			pauseMenu.visible = togglePauseMenu
			get_tree().paused= togglePauseMenu;
		
func _togglePause():
		togglePauseMenu = !togglePauseMenu
		pauseMenu.visible = togglePauseMenu
		get_tree().paused= togglePauseMenu;