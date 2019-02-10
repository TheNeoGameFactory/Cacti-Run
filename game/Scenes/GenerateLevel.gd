####  Scene: LevelRoot  ####
####  Attached: Level   ####
############################
#### Generate the Level ####
############################


extends Spatial

export (int) var fieldWidth = 5
export (int) var fieldLength = 10

export (int) var blockOffsetLenght = 1
export (int) var blockOffsetWidth = 1


export (Array) var walkableArea = []
export (PackedScene) var environmentArea=[]

# Create a 2D Array - X and Y -> Save our field in this
var field = []




func _ready():
	field = _generateArray()
	_generateField()
	pass
	


func _generateArray():
	var array = []
	for w in fieldWidth:
		array.append([])
		for l in fieldLength:
			array[w].append(null)
		
	return array
	
	
	
func _generateField():
	for l in fieldLength:
		var block = walkableArea[0].instance()
		add_child(block)
		block.set_pos = Vector3(0,0,l*blockOffsetLenght)
	
	pass