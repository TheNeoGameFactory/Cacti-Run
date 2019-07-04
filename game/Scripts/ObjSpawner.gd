extends Spatial

# Spawn Chance from 0 to 100
export (int, 0, 100) var spawnChance = 50

func _ready():
	# hide
	self.hide()
	randomize()

	# generate random number
	var rand = randi() %101

	# Spawnen
	if spawnChance > rand:
		self.show()
