extends Spatial


export (Array) var enemys



func _ready():
	randomize()
	var rand = randi() % 11
	if rand == 3 or rand == 7:
		_spawnEnemy()
	pass
	
func _spawnEnemy():
	randomize()
	var rand = randi() % enemys.size()
	var enemy = enemys[rand].instance()
	add_child(enemy)
	pass