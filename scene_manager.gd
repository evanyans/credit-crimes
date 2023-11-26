extends Node2D

const Game = preload("res://game.tscn")
const End = preload("res://endscreen/endscreen.tscn")

func _on_transition_screen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(End.instantiate())
	print("Swapped in scene 2")


func _on_game_game_end():
	$TransitionScreen.transition()
