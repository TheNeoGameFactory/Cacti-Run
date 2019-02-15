extends Label


onready var timer = $Timer





func _on_Timer_timeout():
	self.visible = !self.visible
	timer.start() 
