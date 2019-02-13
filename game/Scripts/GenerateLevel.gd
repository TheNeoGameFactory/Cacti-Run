####  Scene: LevelRoot  ####
####  Attached: Level   ####
############################
#### Generate the Level ####
############################


extends Spatial

#export (int) var fieldWidth = 5
export (int) var fieldLength = 10

#export (int) var blockOffsetWidth = 2


export (Array) var walkableArea
export (PackedScene) var playerScene
#export (PackedScene) var environmentArea=[]

var fieldRootNode
var playerRootNode


var field = []




func _ready():
	
	
#	field = _generateArray()
	
	_generateFieldRootNode()

	_generatePlayerRootNode()
	
	_generateField()
	
	_instantiatePlayer()
	
	
	
	
	
func _process(delta):
	
	_renewBlocks()
	
	
	#Generate the Field Root
func _generateFieldRootNode():
	
	fieldRootNode = Spatial.new()
	add_child(fieldRootNode)
	fieldRootNode.name = "FieldRootNode"
	
	
	#Generate the Player Root
func _generatePlayerRootNode():
	
	playerRootNode = Spatial.new()
	add_child(playerRootNode)
	playerRootNode.name = "PlayerRootNode"


func _instantiatePlayer():
	var player = playerScene.instance()
	playerRootNode.add_child(player)
	player.translation = Vector3(0,0, -1)
	pass


#func _generateArray():
#
#	var array = []
#	for w in fieldWidth:
#		array.append([])
#		for l in fieldLength:
#			array[w].append(null)
#
#	return array
	

func _renewBlocks():
	randomize()
	var lvlBlock = field[0]
	if lvlBlock.translation.z - lvlBlock._getBlockOffset() > get_node("/root/LevelRoot/Camera").translation.z:
		var rand = randi() % walkableArea.size()
		var block = walkableArea[rand].instance()
		fieldRootNode.add_child(block)
		block.translation = Vector3(0,0,field[field.size()-1].translation.z-field[field.size()-1]._getBlockOffset()+0.35)
		field.push_back(block)
		field[0].queue_free()
		field.pop_front()
	pass


	
func _generateField():
	randomize()
	for lenght in fieldLength:
		var rand = randi() % walkableArea.size()
		var block = walkableArea[rand].instance()
		fieldRootNode.add_child(block)
		if(field.size()==0):
			block.translation = Vector3(0,0,0)
			print(lenght)
		else:
			block.translation = Vector3(0,0,field[field.size()-1].translation.z-field[field.size()-1]._getBlockOffset())
		field.push_back(block)
		
	
	pass
#	for lenght in fieldLength:
#		for width in fieldWidth:
#			if width == round(float(fieldWidth)/2)-1:
#				pass
#			else:
#				var block = walkableArea[0].instance()
#				fieldRootNode.add_child(block)
#				block.translation = Vector3(width*blockOffsetWidth,0,-lenght*blockOffsetLenght)
#
#	fieldRootNode.translation = Vector3(-round(float(fieldWidth)/2)-1,0,0)

	