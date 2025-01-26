extends Control


@onready var timer:Timer =  $Timer
@onready var rating_bar:ProgressBar = $Rating
@onready var label_upgdg:Label =  $UpgradeDowngrade


var RATING:float = 100
var upgradeRate:float = 0
var downgradeRate:float = -0.2

# Called when the node enters the scene tree for the first time.
func _ready():

	timer.start()

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label_upgdg.text = "Upgrade: " + ("%.2f" % upgradeRate) + " Downgrade: " + ("%.2f" % downgradeRate)
	


func _on_timer_timeout():
	
	RATING = RATING + upgradeRate + downgradeRate
	
	updateRating()
	timer.start()
	



func updateRating():
	if RATING <= 0.0:
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	rating_bar.value = RATING
	rating_bar.get_child(0).text = "%.2f" % rating_bar.value

func _on_texture_button_pressed(button:TextureButton):
	print("test")
	pass # Replace with function body.


func _on_money_button_pressed():
	RATING = RATING - 2;
	$MoneyLabel.text = String.num(int($MoneyLabel.text)+10) + " $"
	updateRating()


func _on_politican_button_pressed():
	RATING = RATING + 0.05
	#$PoliticanButton.scale = $PoliticanButton.scale  + Vector2(0.1,0.1)
	updateRating()


func _on_texture_button_button_press_param(btn):
	var items = btn.find_children("Item*")
	#test and buy
	var rps = float(items[0].text)
	var count = int(items[1].text)
	var price = int(items[2].text)
	var cur_money = int($MoneyLabel.text)
	if price <= cur_money:
		$MoneyLabel.text = String.num(cur_money-price) + " $"
		items[1].text = String.num(count+1)
		items[2].text = "%.2f" % (price*1.3) + " $"
		upgradeRate = upgradeRate + rps
		

		
		
