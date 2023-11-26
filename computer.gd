extends Node2D

var sprite
var runOnce = true

func _ready():
	sprite = $AnimatedSprite2D
	sprite.frame = 0
	$Stage3/IGPost1/CollisionShape2D.disabled = true
	$Stage3/IGPost2/CollisionShape2D.disabled = true
	$Stage3/Post1/ReturnToIGPost/CollisionShape2D.disabled = true
	$Stage3/Post2/ReturnToIGPost/CollisionShape2D.disabled = true
	$Stage3/Post1.visible = false

func _physics_process(delta):
	print(Globalprices.currentstage)
	if runOnce && Globalprices.currentstage == 2:
		runOnce = false
		$AudioStreamPlayer2D.play()
		$mark.visible = true
	elif Globalprices.currentstage != 2:
		$mark.visible = false
		$Stage3/Post1.visible = false
		$Stage3/Post2.visible = false		
		

func stage3instagram(viewport, event, shape_idx):
	if (Globalprices.currentstage == 2 && event is InputEventMouseButton && event.pressed):
		sprite.frame = 3
		$mark.visible = false
		$Stage3/Instagram/CollisionShape2D.disabled = true
		
		$Stage3/IGPost1/CollisionShape2D.disabled = false
		$Stage3/IGPost2/CollisionShape2D.disabled = false
		


func openigpost1(viewport, event, shape_idx):
	if (Globalprices.currentstage == 2 && event is InputEventMouseButton && event.pressed):
		$Stage3/Post1.visible = true
		$Stage3/IGPost1/CollisionShape2D.disabled = true
		$Stage3/Post1/ReturnToIGPost/CollisionShape2D.disabled = false


func returntoigpost1(viewport, event, shape_idx):
	if (Globalprices.currentstage == 2 && event is InputEventMouseButton && event.pressed):
		$Stage3/Post1.visible = false
		$Stage3/Post1/ReturnToIGPost/CollisionShape2D.disabled = true
		$Stage3/IGPost1/CollisionShape2D.disabled = false



func openigpost2(viewport, event, shape_idx):
	if (Globalprices.currentstage == 2 && event is InputEventMouseButton && event.pressed):
		$Stage3/Post2.visible = true
		$Stage3/IGPost2/CollisionShape2D.disabled = true
		$Stage3/Post2/ReturnToIGPost/CollisionShape2D.disabled = false


func returntoigpost2(viewport, event, shape_idx):
	if (Globalprices.currentstage == 2 && event is InputEventMouseButton && event.pressed):
		$Stage3/Post2.visible = false
		$Stage3/Post2/ReturnToIGPost/CollisionShape2D.disabled = true
		$Stage3/IGPost2/CollisionShape2D.disabled = false
