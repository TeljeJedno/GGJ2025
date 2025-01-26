extends TextureButton
signal buttonPressParam(btn)

 

func _ready():
	pass
	# Get the parent and connect directly
	


func _on_pressed():
	buttonPressParam.emit($".")
