extends Label

export (float) var showCharSpeed=1




func _process(delta):
	if self.percent_visible<1:
		self.percent_visible+=showCharSpeed*delta
		
	pass

