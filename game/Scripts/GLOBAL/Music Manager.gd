extends AudioStreamPlayer

var backgroundMusicTheme = preload("res://Music/Cacti Run Theme.ogg")
var backgroundMusic = preload("res://Music/Mega Hyper Ultrastorm.ogg")

var songTheme = true
var volumeMenu
var volumeGame

onready var currentScene = get_tree().current_scene.name



func _changeSong():
	songTheme = !songTheme
	_playSong()
	pass

func _playSong():
	var play
	if songTheme:
		play = backgroundMusicTheme
		volumeMenu = -5
		volumeGame = 0
	elif not songTheme:
		play = backgroundMusic
		volumeMenu = -10
		volumeGame = -5
		
		
	self.stream = play
	self.play()
	self.volume_db = volumeMenu

func _ready():
	_playSong()
	
func _process(delta):
	if get_tree().current_scene.name != currentScene:
		_checkScene()


func _checkScene():
	var testCurrentScene = get_tree().current_scene.name
	if testCurrentScene == "3D Menu":
		self.volume_db = volumeMenu
	elif testCurrentScene == "LevelRoot":
		self.volume_db = volumeGame
	
	currentScene = testCurrentScene