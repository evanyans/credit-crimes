extends Node2D

var sprite

func _ready():
	sprite = $AnimatedSprite2D
	pass
	


func _on_area_2d_input_event(viewport, event, shape_idx):
	if (Globalprices.currentstage == 3 && event is InputEventMouseButton && event.pressed):
		sprite.frame = 1
		$Instagram.monitoring = false
		$Instagram.monitorable = false
		$Instagram/Screen.monitoring = true
		$Instagram/Screen.monitorable = true
		print('Clicked Instagram')


func _on_screen_input_event(viewport, event, shape_idx):
	if (Globalprices.currentstage == 3 && event is InputEventMouseButton && event.pressed):
		print("opening post")
		$HarmonyClose.visible = true
		$Instagram/Screen.monitoring = false
		$Instagram/Screen.monitorable = false
	


func _on_closeup_input_event2(viewport, event, shape_idx):
	if (Globalprices.currentstage == 3 && event is InputEventMouseButton && event.pressed):
		print("closing post")
		$HarmonyClose.visible = false
		$Instagram/Screen.monitoring = true
		$Instagram/Screen.monitorable = true


func _on_linked_in_input_event3(viewport, event, shape_idx):
	if (Globalprices.currentstage == 2 && event is InputEventMouseButton && event.pressed):
		sprite.frame = 2
		$LinkedIn.monitoring = false
		$LinkedIn.monitorable = false
		$LinkedIn/Screen.monitoring = true
		$LinkedIn/Screen.monitorable = true
		
		$PointLight2D.energy = 0.4
		print('Clicked LinkedIn')


func _on_screen_input_event2(viewport, event, shape_idx):
	if (Globalprices.currentstage == 2 && event is InputEventMouseButton && event.pressed):
		sprite.frame = 0
		$LinkedIn.monitoring = true
		$LinkedIn.monitorable = true
		$LinkedIn/Screen.monitoring = false
		$LinkedIn/Screen.monitorable = false
		print('returned back to home')
		
		$PointLight2D.energy = 0.8
##################################################

func _on_instagram_v_2_input_event(viewport, event, shape_idx):
	if (Globalprices.currentstage == 2 && event is InputEventMouseButton && event.pressed):
		sprite.frame = 3
		$InstagramV2.monitoring = false
		$InstagramV2.monitorable = false
		$Instagram/Screen.monitoring = true
		$Instagram/Screen.monitorable = true
		print('Clicked Instagram')


func _on_screen_input_event4(viewport, event, shape_idx):
	if (Globalprices.currentstage == 2 && event is InputEventMouseButton && event.pressed):
		print("opening post2")
		$MedicalCloseup.visible = true
		$InstagramV2/Screen.monitoring = false
		$InstagramV2/Screen.monitorable = false


func _on_closeup_input_event5(viewport, event, shape_idx):
	if (Globalprices.currentstage == 2 && event is InputEventMouseButton && event.pressed):
		print("closing post")
		$MedicalCloseup.visible = false
		$InstagramV2/Screen.monitoring = true
		$InstagramV2/Screen.monitorable = true
