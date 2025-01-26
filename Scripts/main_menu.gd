extends Control

# Called when the node is ready
# Play button logic
func _on_play_pressed():
	print("Play button pressed!")
	# Change to the game scene
	get_tree().change_scene("res://Scenes/Main.tscn")  # Replace with your game scene path



# Exit button logic
func _on_exit_pressed():
	print("Exit button pressed!")
	# Quit the application
	get_tree().quit()
