extends Spatial

# Spawn Chance von 0 bis 100
export (int, 0, 100) var spawnChance = 50

func _ready():
	# ausblenden
	self.hide()
	randomize()

	# Zufallszahl generiern
	var rand = randi() %101

	# Spawnen
	if spawnChance > rand:
		self.show()
