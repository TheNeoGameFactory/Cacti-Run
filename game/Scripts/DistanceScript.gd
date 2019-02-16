extends Control


onready var distanceText = $Distance_Pivot/TraveledDistance
onready var speedMultiplier = $"/root/LevelRoot/Level"
onready var playerSpeed = $"/root/LevelRoot/Level/PlayerRootNode/Player"
onready var fasterMenu = $"/root/LevelRoot/FASTER Notification"
var distance = 0
var lastDistance = 300
var notCollided = true

func _ready():
	$Restart_Pivot.hide()
	$"Distance_Pivot/Highscore".text = String(int(Highscore.highscore))
	fasterMenu.hide()
	
	


func _process(delta):
	
	_getFaster()
		
		
	if notCollided:
		distance += speedMultiplier.fieldSpeedMultiplier*20*delta
		distanceText.text = String(int(distance))
	else:
		$Distance_Pivot.hide()
		$Restart_Pivot.show()
		
		
func _getFaster():
	if distance > lastDistance:
		$FasterSound.play()
		fasterMenu.show()
		$"/root/LevelRoot/FASTER Notification/Timer".start()
		lastDistance+=distance*1.3
		speedMultiplier.fieldSpeedMultiplier+=0.15
		playerSpeed.playerSpeed *= speedMultiplier.fieldSpeedMultiplier
		if playerSpeed.playerSpeed > 9:
			playerSpeed.playerSpeed = 9
	pass
	
	
	
func _highscore():
	$Distance_Pivot/Highscore.text = Highscore.highscore
	pass
		
func _gameOver():
	var highscoreLabel = $Restart_Pivot/NewHighscoreLabel
	highscoreLabel.hide()
	$"Restart_Pivot/DistanceBG/Traveled Distance".text = "Traveled: " + String(int(distance))
	if int(distance) > Highscore.highscore:
		highscoreLabel.show()
		Highscore.highscore = int(distance)
	get_tree().paused = true
	$Distance_Pivot.hide()
	$Restart_Pivot.show()

func _on_Timer_timeout():
	fasterMenu.hide()
