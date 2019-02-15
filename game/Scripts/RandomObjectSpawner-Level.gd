extends Spatial


export (int, 0, 100) var spawnChance
export (bool) var linkWithOtherObject = false
export (NodePath) var linkedObject = null
export (int, 0, 100) var otherObjectChance = 0

func _ready():
	
	self.hide()
	if linkWithOtherObject:
		get_node(linkedObject).hide()
	randomize()
	
	
	var rand = randi() %101
	
	if spawnChance > rand:
		self.show()
	
	elif spawnChance < rand:
		if linkWithOtherObject:
			get_node(linkedObject).show()
		
		
	
	
