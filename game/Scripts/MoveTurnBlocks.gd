extends Spatial

var movingSpeed = 20

func _process(delta):
	self.translate(Vector3(0,0,movingSpeed*delta))
	

#	# Delete this Block after it is behind the camera
#	if self.translation.z-2 > get_node("/root/LevelRoot/Camera").translation.z:
#		queue_free()
	pass
