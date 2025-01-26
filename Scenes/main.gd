extends Control


@onready var timer:Timer =  $Timer
@onready var evil: Timer = $EvilTimer

@onready var rating_bar:ProgressBar = $Rating
@onready var label_upgdg:Label =  $UpgradeDowngrade


var RATING:float = 100
var upgradeRate:float = 0
var downgradeRate:float = -0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	$PopUpButton.visible=false;
	$PoliticanButton/Chatbox.visible = false;
	timer.start()
	evil.start()

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label_upgdg.text = "Upgrade: " + ("%.2f" % upgradeRate) + " Downgrade: " + ("%.2f" % downgradeRate)
	


func _on_timer_timeout():
	
	RATING = RATING + upgradeRate + downgradeRate
	
	updateRating()
	timer.start()
	



func updateRating():
	var numb = randf()
	#print(numb)

	
	if numb <0.007:
		$PopUpButton.visible = true
		RATING = RATING * 0.6
	if RATING <= 0.0:
		Global.Score = $SquareGreenCopy/MoneyLabel.text
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	rating_bar.value = RATING
	rating_bar.get_child(0).text = "%.2f" % rating_bar.value

func _on_texture_button_pressed(button:TextureButton):
	print("test")
	pass # Replace with function body.

var speedOfIncreasingMoney = 15
func _on_money_button_pressed():
	RATING = RATING - 1;
	var ml = 	$SquareGreenCopy/MoneyLabel;
	
	ml.text = "%.0f"%(int(ml.text)+speedOfIncreasingMoney) + " $"
	updateRating()



var quotes = ["We will have flying cars in the future",
"We will be the first we autonomous driving wehicle",
"I will solve all your problems",
"I paved this country!!",
"We are solving the hunger crisis, sandwich by sandwich",
"Every problem was cause by my predecessors",
"I DO NOT HAVE ANY FILLERS! They are lying",
"I am bringing the piece and they want war!"]
func _on_politican_button_pressed():
	
		
	RATING = RATING + 0.5
	$PoliticanButton/Chatbox.visible = true;
	$PoliticanButton/Chatbox/Label.text = quotes.pick_random()
	#$PoliticanButton.scale = $PoliticanButton.scale  + Vector2(0.1,0.1)
	updateRating()


func _on_texture_button_button_press_param(btn):
	var items = btn.find_children("Item*")
	#test and buy
	var rps = float(items[0].text)
	var count = int(items[1].text)
	var price = int(items[2].text)
	var cur_money = int($SquareGreenCopy/MoneyLabel.text)
	if price <= cur_money:
		$SquareGreenCopy/MoneyLabel.text = String.num(cur_money-price) + " $"
		items[1].text = String.num(count+1)
		items[2].text = "%.2f" % (price*1.2) + " $"
		upgradeRate = upgradeRate + rps
		

		
		


func _on_evil_timer_timeout():
	speedOfIncreasingMoney = speedOfIncreasingMoney*1.2
	downgradeRate = downgradeRate - 0.03
	evil.start()


func _on_pop_up_button_pressed():
	$PopUpButton.visible=false;
