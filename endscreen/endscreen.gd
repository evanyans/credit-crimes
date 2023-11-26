extends Node2D

var animplayer
var sum

func _ready():
	sum = 0
	animplayer = $AnimationPlayer
	animplayer.play("finish")
	$AudioStreamPlayer2D.play()
	for n in range(0,4):
		sum += Globalprices.game_deductions[n]
		
	$Money1.text = str(Globalprices.game_deductions[0]) + "$"
	$Money2.text = str(Globalprices.game_deductions[1]) + "$"
	$Money3.text = str(Globalprices.game_deductions[2]) + "$"
	$Money4.text = str(Globalprices.game_deductions[3]) + "$"

	$Money6.text = str(Globalprices.food) + "$"
	$Money7.text = str(Globalprices.rent) + "$"
	$Money8.text = str(Globalprices.tax) + "$"
	
	$Money9.text = str(sum) + "$"
	
	
	
	
	
	
