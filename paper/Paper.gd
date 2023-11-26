extends CharacterBody2D

var draggingDistance
var dir
var dragging
var newPosition = Vector2()

var mouse_in = false
var ischosen = false

var animator

func _ready():
	animator = get_node("AnimatedSprite2D")

func give_template(formtype):
	add_child(formtype)

func _input(event):
	if event is InputEventMouseButton:
		if chosen and event.is_pressed() && mouse_in:
			draggingDistance = position.distance_to(get_viewport().get_mouse_position())
			dir = (get_viewport().get_mouse_position() - position).normalized()
			dragging = true
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir
		else:
			dragging = false
			ischosen = false
			
	elif event is InputEventMouseMotion:
		if dragging:
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir

func _physics_process(delta):
	if dragging:
		set_velocity((newPosition - position) * Vector2(30, 30))
		move_and_slide()


func chosen():
	ischosen = true
	
func mouse_entered():
	mouse_in = true

func mouse_exited():
	mouse_in = false


func _on_shrink_detector_area_entered(area):
	#later, instead of changing the scale, just change the animation/sprite
	if area.name == "ShrinkZone2":
		scale.x= -1
	animator.frame= 0


func _on_shrink_detector_area_exited(area):
	if area.name == "ShrinkZone2":
		scale.x= -1
	animator.frame= 1
