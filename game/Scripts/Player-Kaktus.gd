extends Spatial

export (float) var playerSpeed = 2
export (float) var followSpeed = 3


var playerRootNode
var cameraNode

func _ready():
	playerRootNode = get_node("/root/LevelRoot/Level/PlayerRootNode")
	cameraNode = get_node("/root/LevelRoot/Camera")
	pass

func _process(delta):
	
	if Input.is_action_pressed("Move_Left"):
		self.translate(Vector3(-playerSpeed*delta,0,0))
		
	elif Input.is_action_pressed("Move_Right"):
		self.translate(Vector3(playerSpeed*delta,0,0))
		
	elif Input.is_action_just_pressed("Sliding"):
		print("Sliding")
		
	
	var distance = (playerRootNode.translation - self.translation)/1.25
	var camera = get_node("/root/LevelRoot/Camera")
	camera.look_at(self.translation+Vector3(0,3,0),Vector3.UP)
#	camera.translation = camera.translation.linear_interpolate(self.translation+Vector3(0,3,3) ,delta*followSpeed)
	camera.translation = self.translation+Vector3(0,2,3)+Vector3(distance.x/3,2,0)
	
