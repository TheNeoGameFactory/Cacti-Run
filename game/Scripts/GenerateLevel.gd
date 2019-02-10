####  Scene: LevelRoot  ####
####  Attached: Level   ####
############################
#### Generate the Level ####
############################


extends Spatial

export (int) var fieldWidth = 5
export (int) var fieldLength = 10

export (int) var blockOffsetLenght = 2
export (int) var blockOffsetWidth = 2


export (Array) var walkableArea = []
export (PackedScene) var environmentArea=[]

var fieldRootNode

# Create a 2D Array - X and Y -> Save our field in this
var field = []




func _ready():
	field = _generateArray()
	fieldRootNode = Spatial.new()
	add_child(fieldRootNode)
	fieldRootNode.name = "FieldRootNode"
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
	for lenght in fieldLength:
		for width in fieldWidth:
			if width == round(float(fieldWidth)/2)-1:
				pass
			else:
				var block = walkableArea[0].instance()
				fieldRootNode.add_child(block)
				block.translation = Vector3(width*blockOffsetWidth,0,-lenght*blockOffsetLenght)
	
	fieldRootNode.translation = Vector3(-round(float(fieldWidth)/2)-1,0,0)
	print(round(float(fieldWidth)/2))
	pass