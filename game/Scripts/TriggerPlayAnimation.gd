extends Area

export (NodePath) var animationPlayer
export (String) var startAnimationName



func _ready():
	self.connect("area_entered",self,"_on_Area_body_entered")
	
func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		get_node(animationPlayer).play(startAnimationName)


func _on_Area_area_entered(area):
		if area.is_in_group("Player"):
			get_node(animationPlayer).play(startAnimationName)
