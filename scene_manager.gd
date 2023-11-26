extends Node2D

const Title = preload("res://menu.tscn")
const Game = preload("res://game.tscn")
const End = preload("res://endscreen/endscreen.tscn")

func _on_transition_screen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Game.instantiate())
	print("Swapped in scene 2")


func _on_game_game_end():
	$TransitionScreen.transition()


func _on_menu_startgame():
	$TransitionScreen.transition()
