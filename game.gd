extends Node2D

signal game_end

var case1 = preload("res://cases/case1.tscn")
var case2 = preload("res://cases/case2.tscn")
var case3 = preload("res://cases/case3.tscn")
var case4 = preload("res://cases/case4.tscn")
var paper_scene = preload("res://paper/Paper.tscn")
var end_scene = load("res://endscreen/endscreen.tscn")

var paper_stack = []
var cases = [case1.instantiate(), case2.instantiate(), case3.instantiate(), case4.instantiate()] # array of cases 0-4
var current_state

#GAME STATE VARIABLES:
var case

var timer
var shiftbar
var quota

func _ready():
	quota = $QUOTA
	$AudioStreamPlayer2D.play()
	timer = get_node("Timer")
	shiftbar = get_node("ShiftBar")
	timer.start()
	current_state=0
	quota.text = "CASE " + str(1) + "/4"
	Globalprices.currentstage = 0
	case = cases[current_state]
	add_child(case)
	pass

func _physics_process(delta):
	#print(timer.time_left)
	shiftbar.value = (timer.time_left/600)*10000

func next_case(choice):
	Globalprices.currentstage += 1
	current_state = current_state +1
	if current_state < 4:
		if choice == case.correct_answer:
			quota.text = "CASE " + str(current_state+1) + "/4"
			Globalprices.game_deductions[current_state-1] = 16.55
			print("CORRECT!")
		else:
			print("WRONG!")
			quota.text = "CASE " + str(current_state+1) + "/4"
			Globalprices.game_deductions[current_state-1] = -20.45
		remove_case()
		case = cases[current_state]
		add_child(case)
	else:
		if choice == case.correct_answer:
			quota.text = "CASE " + str(current_state+1) + "/4"
			Globalprices.game_deductions[current_state-1] = 16.55
			print("CORRECT!")
		else:
			print("WRONG!")
			quota.text = "CASE " + str(current_state+1) + "/4"
			Globalprices.game_deductions[current_state-1] = -20.45
		game_ended()
		
	
func remove_case():
	#do transition here
	remove_child(case)
	pass

func game_ended():
	get_tree().change_scene_to_packed(end_scene)

func add_paper(paper):
	paper_stack.append(paper)
	
	var count = 0
	for p in paper_stack:
		p.z_index = count
		
		count += 1

func push_paper_to_top(paper):
	paper_stack.erase(paper)
	add_paper(paper)



func _on_yes_pressed():
	$AudioStreamPlayer2D2.play()
	next_case(0)

func _on_no_pressed():
	$AudioStreamPlayer2D2.play()
	next_case(1)
	
func _on_audit_pressed():
	$AudioStreamPlayer2D2.play()
	next_case(2)


func _on_timer_timeout():
	game_ended()
