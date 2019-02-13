extends Spatial




func _ready():
	randomize()
	var rand = randi() %12
	if rand < 6:
		self.hide()
	
	
