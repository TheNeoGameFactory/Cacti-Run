extends Control


onready var distanceText = $Distance_Pivot/TraveledDistance
onready var speedMultiplier = $"/root/LevelRoot/Level"
var distance = 0
var notCollided = true

func _ready():
	$Restart_Pivot.hide()
	$"Distance_Pivot/Highscore".text = String(int(Highscore.highscore))
	


func _process(delta):
	if distance > 1000:
		speedMultiplier.fieldSpeedMultiplier = 1.5
	if distance > 2000:
		speedMultiplier.fieldSpeedMultiplier = 2
	if distance > 4000:
		speedMultiplier.fieldSpeedMultiplier = 3
		
		
	if notCollided:
		distance += speedMultiplier.fieldSpeedMultiplier*20*delta
		distanceText.text = String(int(distance))
	else:
		$Distance_Pivot.hide()
		$Restart_Pivot.show()
		
		
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