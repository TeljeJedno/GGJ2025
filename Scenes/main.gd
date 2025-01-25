extends Control


@onready var timer:Timer =  $Timer
@onready var label_rating:Label =  $Label
var RATING:float = 100
var upgradeRate:float = 0
var downgradeRate:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():

	timer.start()
	label_rating.text =  "Rating: " + ("%.2f" % RATING)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	
	calculateRating()
	timer.start()
	

func calculateRating():
	RATING = RATING + upgradeRate + downgradeRate
	
	
	if RATING <= 0.0:
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	label_rating.text =  "Rating: " + ("%.2f" % RATING)
