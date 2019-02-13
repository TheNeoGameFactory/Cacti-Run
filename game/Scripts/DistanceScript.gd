extends Control


var distanceText
var speedMultiplier
var distance = 0
var notCollided = true

func _ready():
	distanceText = $Distance_Pivot/TraveledDistance
	speedMultiplier = $"/root/LevelRoot/Level"
	$Restart_Pivot.hide()


func _process(delta):
	if notCollided:
		distance += speedMultiplier._getSpeedMultiplier()*20*delta
		distanceText.text = String(int(distance))
	else:
		$Distance_Pivot.hide()
		$Restart_Pivot.show()
		
		
		
func _gameOver():
	get_tree().paused = true
	$Distance_Pivot.hide()
	$Restart_Pivot.show()