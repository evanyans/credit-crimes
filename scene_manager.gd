extends Node2D

const Game = preload("res://game.tscn")
const End = preload("res://endscreen/endscreen.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$TransitionScreen.transition()

func _on_transition_screen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(End.instantiate())
	print("Swapped in scene 2")
