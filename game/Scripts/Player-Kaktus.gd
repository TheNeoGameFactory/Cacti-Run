extends Spatial

export (float) var playerSpeed = 4 setget _setPlayerSpeed, _getPlayerSpeed
export (float) var followSpeed = 3 
var movement = 0
var touchscreenPressed = false


onready var playerRootNode = get_node("/root/LevelRoot/Level/PlayerRootNode")
onready var cameraNode = get_node("/root/LevelRoot/Camera")



func _physics_process(delta):
	
	
	
	if Input.is_action_pressed("Move_Left"):
		movement = playerSpeed * -1
		
	elif Input.is_action_pressed("Move_Right"):
		movement = playerSpeed
		
	elif Input.is_action_just_pressed("Sliding"):
		print("Sliding")
		
	
	self.translate(Vector3(movement*delta,0,0))
	
	var distance = (playerRootNode.translation - self.translation)/1.25
	var camera = get_node("/root/LevelRoot/Camera")
	camera.look_at(self.translation+Vector3(0,2,0),Vector3.UP)
#	camera.translation = camera.translation.linear_interpolate(self.translation+Vector3(0,3,3) ,delta*followSpeed)
	camera.translation = self.translation+Vector3(distance.x/8,3,2)
	if not touchscreenPressed : movement = 0


func _setPlayerSpeed(newValue):
	playerSpeed = newValue
	
	
func _getPlayerSpeed():
	return playerSpeed

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			touchscreenPressed = true
			var screenHalfWidth = get_viewport().size.x/2
			if event.position.x < screenHalfWidth:
				movement = playerSpeed * -1
			elif event.position.x > screenHalfWidth:
				movement = playerSpeed 
			print(screenHalfWidth)
		elif not event.pressed:
			touchscreenPressed = false




func _on_Area_body_entered(body):
	if body.is_in_group("enemy") or body.is_in_group("environment"):
		if body.is_visible_in_tree():	
			$"/root/LevelRoot/PlayMenu"._gameOver()
