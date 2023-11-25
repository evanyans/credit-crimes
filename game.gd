extends Node2D

var case1 = preload("res://cases/case1.tscn")
var case2 = preload("res://cases/case2.tscn")
var paper_scene = preload("res://paper/Paper.tscn")

var paper_stack = []
var cases = [case1.instantiate(), case2.instantiate()] # array of cases 0-4
var current_case

#GAME STATE VARIABLES:
var case

var timer
var shiftbar

func _ready():
	timer = get_node("Timer")
	shiftbar = get_node("ShiftBar")
	timer.start()
	current_case=0
	case = cases[current_case]
	add_child(case)
	pass
#	for i in range(0, 2):
#		var paper = paper_scene.instantiate()
#		#var form = form_1099.instantiate()
#		#p#aper.give_template(form)
#		add_child(paper)
#		add_paper(paper)

func _physics_process(delta):
	#print(timer.time_left)
	shiftbar.value = timer.time_left
	pass
	
func next_case(choice):
	var current_state = current_case+1
	if current_state < 5:
		if choice == case.correct_answer:
			print("CORRECT!")
		else:
			print("WRONG!")
		case = cases[current_state]
		add_child(case)
	else:
		game_ended()
		
	
func remove_case():
	#do transition here
	remove_child(case)
	pass

func game_ended():
	print("the shift ended, display screen here")

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
	next_case(0)

func _on_no_pressed():
	next_case(1)
	
func _on_audit_pressed():
	next_case(2)


func _on_timer_timeout():
	game_ended()
