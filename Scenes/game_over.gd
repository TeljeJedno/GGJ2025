extends Control


func _ready():
	$Panel/Label.text = "HIGHSCORE : " + str(Global.Score)
	pass


func _on_exit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")  # Replace with your game scene path
