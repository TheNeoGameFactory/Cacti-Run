extends AudioStreamPlayer

var backgroundMusic = preload("res://Music/Mega Hyper Ultrastorm.ogg")

onready var currentScene = get_tree().current_scene.name

func _ready():
	self.stream = backgroundMusic
	self.play()
	self.volume_db = -10

	
func _process(delta):
	if get_tree().current_scene.name != currentScene:
		_checkScene()


func _checkScene():
	var testCurrentScene = get_tree().current_scene.name
	if testCurrentScene == "3D Menu":
		self.volume_db = -10
	elif testCurrentScene == "LevelRoot":
		self.volume_db = -5
	
	currentScene = testCurrentScene